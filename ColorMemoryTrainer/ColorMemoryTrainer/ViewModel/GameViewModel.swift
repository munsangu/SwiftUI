import SwiftUI
import SwiftData
import AVFoundation

final class GameViewModel: ObservableObject {
    @Published var phase: GamePhase = .preview
    @Published var sequence: [GameColor] = []
    @Published var userInput: [GameColor] = []
    @Published var highlightIndex: Int? = nil
    @Published var score: Int = 0
    @Published var remainingLives: Int = 3
    
    private var level: Int = 3
    private var player: AVAudioPlayer?
    var modelContext: ModelContext?
    @AppStorage("playerNickname") private var playerNickname: String = "Player"

    init() {
        startNewGame()
    }
    
    func setContext(_ context: ModelContext) {
        self.modelContext = context
    }

    func startNewGame() {
        guard remainingLives > 0 else {
            phase = .gameOver
            return
        }
        
        userInput = []
        score = 0
        phase = .preview
        sequence = (0..<level).map { _ in GameColor.allCases.randomElement()! }
        startHighlighting()
    }

    private func startHighlighting() {
        let interval = max(0.6 - Double(level) * 0.05, 0.2)
        
        for (index, _) in sequence.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * interval) {
                self.highlightIndex = index
                DispatchQueue.main.asyncAfter(deadline: .now() + interval * 0.6) {
                    self.highlightIndex = nil
                }
            }
        }

        let totalDuration = Double(sequence.count) * interval + 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + totalDuration) {
            self.phase = .input
        }
    }

    func selectColor(_ color: GameColor) {
        guard phase == .input else { return }
        userInput.append(color)
        
        if userInput.count == sequence.count {
            checkAnswer()
        }
    }

    func checkAnswer() {
        let correct = zip(sequence, userInput).filter { $0 == $1 }.count
        score = correct
        phase = .result

        if score == sequence.count {
            playSound(named: "success")
            saveToLeaderboard()
        } else {
            remainingLives -= 1
            playSound(named: "fail")
            if remainingLives == 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.phase = .gameOver
                    self.saveToLeaderboard()
                }
            }
        }
    }

    func retry() {
        startNewGame()
    }

    func nextLevel() {
        level += 1
        startNewGame()
    }

    func resetGame() {
        remainingLives = 3
        level = 3
        startNewGame()
    }

    private func playSound(named file: String) {
        guard let url = Bundle.main.url(
            forResource: file,
            withExtension: "wav"
        ) else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Sound error: \(error.localizedDescription)")
        }
    }
    
    private func saveToLeaderboard() {
        guard let context = modelContext else { return }
        let entry = LeaderboardEntry(
            level: level,
            score: score,
            nickname: playerNickname
        )
        context.insert(entry)
        do {
            try context.save()
            print("✅ Leaderboard saved: \(playerNickname), score: \(score)")
        } catch {
            print("Failed to save leaderboard entry: \(error)")
        }
    }
}
