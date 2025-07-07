import SwiftUI
import AVFoundation

final class GameViewModel: ObservableObject {
    @Published var phase: GamePhase = .preview
    @Published var sequence: [GameColor] = []
    @Published var userInput: [GameColor] = []
    @Published var highlightIndex: Int? = nil
    @Published var score: Int = 0
    
    private var level: Int = 3
    private var player: AVAudioPlayer?
    
    init() {
        startNewGame()
    }
    
    func startNewGame() {
        userInput = []
        score = 0
        phase = .preview
        sequence = (0..<level).map { _ in GameColor.allCases.randomElement()! }
        startHighlighting()
    }

    private func startHighlighting() {
        for (index, _) in sequence.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.6) {
                self.highlightIndex = index
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.highlightIndex = nil
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(sequence.count) * 0.6 + 0.5) {
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
            playSuccessSound()
        }
    }

    func retry() {
        startNewGame()
    }

    func nextLevel() {
        level += 1
        startNewGame()
    }

    private func playSuccessSound() {
        guard let url = Bundle.main.url(
            forResource: "success",
            withExtension: "wav"
        ) else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Sound error:", error.localizedDescription)
        }
    }
}
