import SwiftUI

extension View {
    @ViewBuilder
    func shine<S: Shape>(
        _ toggle: Bool,
        duration: CGFloat = 0.5,
        clipShape: S,
        rightToLeft: Bool = false
    ) -> some View {
        self.modifier(ShineViewModifier(
            isActive: toggle,
            duration: duration,
            clipShape: clipShape,
            rightToLeft: rightToLeft
        ))
    }
}
