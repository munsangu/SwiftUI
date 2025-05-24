import Foundation

struct MenuAction: Identifiable {
    private(set) var id: String = UUID().uuidString
    var symbolImage: String
    var text: String
    var action: () -> () = {}
}

@resultBuilder
struct MenuActionBuilder {
    static func buildBlock(_ components: MenuAction...) -> [MenuAction] {
        components.compactMap({ $0 })
    }
}
