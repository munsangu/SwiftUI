import SwiftUI

enum Player: String {
    case x = "X"
    case o = "O"
    
    var next: Player {
        return self == .x ? .o : .x
    }
}

struct GameCell: Identifiable {
    let id = UUID()
    var player: Player?
}
