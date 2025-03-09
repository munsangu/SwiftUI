import SwiftUI

struct AnimatedRing: View {
    let isActive: Bool
    let animation: Namespace.ID
    
    var body: some View {
        if isActive {
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    .white,
                    lineWidth: 1.5
                )
                .matchedTransitionSource(
                    id: "RING",
                    in: animation
                )
        }
    }
}
