import Foundation

enum GameType: String, CaseIterable {
    case A
    case B
}

struct GameItem: Identifiable, Equatable {
    let id = UUID()
    let type: GameType
    
    static func == (
        lhs: GameItem,
        rhs: GameItem
    ) -> Bool {
        lhs.id == rhs.id && lhs.type == rhs.type
    }
}
