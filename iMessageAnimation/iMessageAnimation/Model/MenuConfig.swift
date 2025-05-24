import SwiftUI

struct MenuConfig {
    var symbolImage: String
    var sourceLocation: CGRect = .zero
    var showMenu: Bool = false
    var sourceView: AnyView = .init(EmptyView())
    var hideSourceView: Bool = false
}
