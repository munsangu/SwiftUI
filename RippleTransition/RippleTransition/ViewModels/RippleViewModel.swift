import SwiftUI

@MainActor
final class RippleViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published var rippleLocation: CGPoint = .zero
    @Published var showOverlayView: Bool = false
    @Published var overlayRippleLocation: CGPoint = .zero

    func handleTap(at location: CGPoint) {
        rippleLocation = location
        withAnimation(.linear(duration: 1)) {
            count = (count + 1) % 2
        }
    }

    func handleOverlayButtonTap(from frame: CGRect) {
        overlayRippleLocation = CGPoint(
                                        x: frame.midX,
                                        y: frame.midY
                                    )
        withAnimation(.linear(duration: 1)) {
            showOverlayView = true
        }
    }

    func dismissOverlay() {
        withAnimation(.easeInOut(duration: 0.55)) {
            showOverlayView = false
        }
    }
}
