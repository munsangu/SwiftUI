import Foundation

struct ReactionResult: Identifiable {
    let id = UUID()
    let reactionTime: Int
}

enum GamePhase {
    case idle
    case waiting
    case ready
    case result(Int)
}
