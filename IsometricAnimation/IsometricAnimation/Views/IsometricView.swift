import SwiftUI

struct IsometricView<
    Content: View,
    Bottom: View,
    Side: View
>: View {
    var content: Content
    var bottom: Bottom
    var side: Side
    var depth: CGFloat
    
    init(
        depth: CGFloat,
        @ViewBuilder content: @escaping () -> Content,
        bottom: @escaping () -> Bottom,
        @ViewBuilder side: @escaping () -> Side
    ) {
        self.depth = depth
        self.content = content()
        self.bottom = bottom()
        self.side = side()
    }
    
    var body: some View {
        Color.clear
            .overlay {
                GeometryReader {
                    let size = $0.size
                    
                    ZStack {
                        content
                        DepthView(
                            isBottom: true,
                            size: size
                        )
                        DepthView(size: size)
                    }
                    .frame(
                        width: size.width,
                        height: size.height
                    )
                }
            }
    }
    
    @ViewBuilder
    func DepthView(
        isBottom: Bool = false,
        size: CGSize
    ) -> some View {
        ZStack {
            if isBottom {
                bottom
                    .scaleEffect(
                        y: depth,
                        anchor: .bottom
                    )
                    .frame(
                        height: depth,
                        alignment: .bottom
                    )
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(0.25))
                            .blur(radius: 2.5)
                    }
                    .clipped()
                    .projectionEffect(.init(.init(1, 0, 1, 1, 0, 0)))
                    .offset(y: depth)
                    .frame(
                        maxHeight: .infinity,
                        alignment: .bottom
                    )
            } else {
                side
                    .scaleEffect(
                        x: depth,
                        anchor: .trailing
                    )
                    .frame(
                        width: depth,
                        alignment: .trailing
                    )
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(0.25))
                            .blur(radius: 2.5)
                    }
                    .clipped()
                    .projectionEffect(.init(.init(1, 1, 0, 1, 0, 0)))
                    .offset(x: depth)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .trailing
                    )
            }
        }
    }
}
