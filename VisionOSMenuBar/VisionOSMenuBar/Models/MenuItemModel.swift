import Foundation

enum MenuItemAction {
    case viewfinder
    case pin
    case lock
    case find
    case move
    case linesAndGrids
    case delete
}

struct MenuItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var iconName: String
    var action: MenuItemAction
}
