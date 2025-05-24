import SwiftUI

struct MenuSourceButton<Content: View>: View {
    @Binding var config: MenuConfig
    @ViewBuilder var content: Content
    var onTap: () -> ()
    var body: some View {
        content
            .contentShape(.rect)
            .onTapGesture {
                onTap()
                config.sourceView = .init(content)
                config.showMenu.toggle()
            }
            .onGeometryChange(for: CGRect.self) {
                $0.frame(in: .global)
            } action: { newValue in
                config.sourceLocation = newValue
            }
            .opacity(config.hideSourceView ? 0.01 : 1)

    }
}
