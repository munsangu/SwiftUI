import SwiftUI

extension View {
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .tag(tab)
            .toolbar(
                .hidden,
                for: .tabBar
            )
    }
}
