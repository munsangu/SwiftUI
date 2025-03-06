import SwiftUI

extension AnyTransition {
    static var blurReplace: AnyTransition {
        .asymmetric(
            insertion: .opacity.combined(with: .scale(scale: 0.8))
                .animation(.spring(response: 0.3, dampingFraction: 0.7)),
            removal: .opacity.combined(with: .scale(scale: 1.2))
                .animation(.spring(response: 0.3, dampingFraction: 0.7))
        )
    }
}
