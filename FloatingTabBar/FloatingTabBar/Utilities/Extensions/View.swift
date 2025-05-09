import SwiftUI

extension View {
    func hideFloatingTabBar(_ status: Bool) -> some View {
        self
            .modifier(HideFloatingTabBarModifier(status: status))
    }
}
