import SwiftUI

@MainActor
final class ReactionViewModel: ObservableObject {
    @Published var phase: GamePhase = .idle
    private var startTime: Date?
    
    func startGame() {
        phase = .waiting
        let delay = Double.random(in: 2...5)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.startTime = Date()
            self.phase = .ready
        }
    }
    
    func userTapped() {
        switch phase {
        case .waiting:
            phase = .result(-1)
        case .ready:
            if let start = startTime {
                let reaction = Int(Date().timeIntervalSince(start) * 1000)
                phase = .result(reaction)
            }
        default:
            break
        }
    }
    
    func resetGame() {
        phase = .idle
        startTime = nil
    }
}
