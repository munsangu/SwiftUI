import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var phase: GamePhase = .preview
    @Published var sequence: [GameColor] = []
    @Published var userInput: [GameColor] = []
    @Published var showResult: Bool = false
    @Published var score: Int = 0
    
    private var level: Int = 3
    private var previewDuration: Double = 2.0

    init() {
        startNewGame()
    }
    
    func startNewGame() {
        phase = .preview
        userInput = []
        score = 0
        sequence = (0..<level).map { _ in GameColor.allCases.randomElement()! }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + previewDuration) {
            withAnimation {
                self.phase = .input
            }
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
    }

    func nextLevel() {
        level += 1
        startNewGame()
    }

    func retry() {
        startNewGame()
    }
}
