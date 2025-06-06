import SwiftUI

struct MorphingSymbolView: View {
    var symbol: String
    var config: Config
    @State private var trigger: Bool = false
    @State private var displayingSymbol: String = ""
    @State private var nextSymbol: String = ""
    var body: some View {
        Canvas { ctx, size in
            ctx.addFilter(
                .alphaThreshold(
                    min: 0.4,
                    color: config.foregroundColor
                )
            )
            
            if let renderedImage = ctx.resolveSymbol(id: 0) {
                ctx.draw(
                    renderedImage,
                    at: CGPoint(
                        x: size.width / 2,
                        y: size.height / 2
                    )
                )
            }
        } symbols: {
            ImageView()
                .tag(0)
        }
        .frame(
            width: config.frame.width,
            height: config.frame.height
        )
        .onChange(of: symbol) { oldValue, newValue in
            trigger.toggle()
            nextSymbol = newValue
        }
        .task {
            guard displayingSymbol == "" else { return }
            displayingSymbol = symbol
        }
    }
    
    @ViewBuilder
    func ImageView() -> some View {
        KeyframeAnimator(
            initialValue: CGFloat.zero,
            trigger: trigger
        ) { radius in
            Image(systemName: displayingSymbol)
                .font(config.font)
                .blur(radius: radius)
                .frame(
                    width: config.frame.width,
                    height: config.frame.height
                )
                .onChange(of: radius) { oldValue, newValue in
                    if newValue.rounded() == config.radius {
                        withAnimation(config.symbolAnimation) {
                            displayingSymbol = nextSymbol
                        }
                    }
                }
        } keyframes: { _ in
            CubicKeyframe(
                config.radius,
                duration: config.keyFrameDuration
            )
            CubicKeyframe(
                0,
                duration: config.keyFrameDuration
            )
        }
    }
}

#Preview {
    MorphingSymbolView(
        symbol: "gearshape.fill",
        config: .init(
            font: .system(
                size: 100,
                weight: .bold
            ),
            frame: CGSize(
                width: 250,
                height: 200
            ),
            radius: 15,
            foregroundColor: .black)
    )
}
