import SwiftUI

struct FloatingActionModel: Identifiable {
    let id: UUID = .init()
    let symbol: String
    let font: Font
    let tint: Color
    let background: Color
    let action: () -> Void
    
    init(
        symbol: String,
        font: Font = .title3,
        tint: Color = .white,
        background: Color = .black,
        action: @escaping () -> Void
    ) {
        self.symbol = symbol
        self.font = font
        self.tint = tint
        self.background = background
        self.action = action
    }
}

@resultBuilder
struct FloatingActionBuilder {
    static func buildBlock(_ components: FloatingActionModel...) -> [FloatingActionModel] {
        components.compactMap { $0 }
    }
}
