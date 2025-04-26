import SwiftUI

struct ShineViewModifier<S: Shape>: ViewModifier {
    let isActive: Bool
    let duration: CGFloat
    let clipShape: S
    let rightToLeft: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader {
                    let size = $0.size
                    let modedDuration = max(0.3, duration)
                    
                    Rectangle()
                        .fill(
                            .linearGradient(
                                colors: [
                                    .clear,
                                    .clear,
                                    .white.opacity(0.1),
                                    .white.opacity(0.5),
                                    .white.opacity(1),
                                    .white.opacity(0.5),
                                    .white.opacity(0.1),
                                    .clear,
                                    .clear,
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .scaleEffect(y: 8)
                        .keyframeAnimator(
                            initialValue: 0.0,
                            trigger: isActive,
                            content:
                                { content, progress in
                                content
                                    .offset(x: -size.width + (progress * (size.width * 2)))
                            }, keyframes: { _ in
                                CubicKeyframe(.zero, duration: 0.1)
                                CubicKeyframe(1, duration: modedDuration)
                            }
                        )
                        .rotationEffect(.init(degrees: 45))
                        .scaleEffect(x: rightToLeft ? -1 : 1)
                }
            }
            .clipShape(clipShape)
    }
}
