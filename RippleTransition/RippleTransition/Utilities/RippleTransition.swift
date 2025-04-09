import SwiftUI

struct Ripple: ViewModifier {
    var location: CGPoint
    var isIdentity: Bool

    func body(content: Content) -> some View {
        content.mask(alignment: .topLeading) {
            MaskShape()
                .ignoresSafeArea()
        }
    }

    private func MaskShape() -> some View {
        GeometryReader { geometry in
            let size = geometry.size
            let progress: CGFloat = isIdentity ? 1 : 0
            let circleSize: CGFloat = 50
            let radius: CGFloat = circleSize / 2
            let scale: CGFloat = max(size.width / radius, size.height / radius) + 4
            let defaultScale: CGFloat = isIdentity ? 1 : 0

            ZStack {
                ForEach(0..<4) { i in
                    Circle()
                        .frame(width: circleSize + CGFloat(i * 10), height: circleSize + CGFloat(i * 10))
                        .blur(radius: CGFloat(i) * 2)
                        .opacity(i == 3 ? 0.5 : 1)
                }
            }
            .frame(width: circleSize, height: circleSize)
            .compositingGroup()
            .scaleEffect(defaultScale + (scale * progress), anchor: .center)
            .offset(x: location.x - radius, y: location.y - radius)
        }
    }
}

struct IdentityDelayTransition: ViewModifier {
    var opacity: CGFloat
    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}

extension AnyTransition {
    static func ripple(location: CGPoint) -> AnyTransition {
        .asymmetric(
            insertion: .modifier(
                active: Ripple(location: location, isIdentity: false),
                identity: Ripple(location: location, isIdentity: true)
            ),
            removal: .modifier(
                active: IdentityDelayTransition(opacity: 0.99),
                identity: IdentityDelayTransition(opacity: 1)
            )
        )
    }

    static func reverseRipple(location: CGPoint) -> AnyTransition {
        .modifier(
            active: Ripple(location: location, isIdentity: false),
            identity: Ripple(location: location, isIdentity: true)
        )
    }
}
