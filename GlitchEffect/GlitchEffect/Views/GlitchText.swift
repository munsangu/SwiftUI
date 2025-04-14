import SwiftUI

struct GlitchText: View {
    var text: String
    var trigger: Bool
    var shadow: Color
    var radius: CGFloat
    var frames: [LinearKeyframe<GlitchFrame>]
    
    init(
        text: String,
        trigger: Bool,
        shadow: Color = .red,
        radius: CGFloat = 1,
        @GlithFrameBuilder frames: @escaping () ->  [LinearKeyframe<GlitchFrame>]
    ) {
        self.text = text
        self.trigger = trigger
        self.shadow = shadow
        self.radius = radius
        self.frames = frames()
    }
    var body: some View {
        KeyframeAnimator(
            initialValue: GlitchFrame(),
            trigger: trigger
        ) { value in
            ZStack {
                TextView(
                    .top,
                    offset: value.top,
                    opacity: value.shadowOpacity
                )
                TextView(
                    .center,
                    offset: value.center,
                    opacity: value.shadowOpacity
                )
                TextView(
                    .bottom,
                    offset: value.bottom,
                    opacity: value.shadowOpacity
                )
            }
        } keyframes: { _ in
            for frame in frames {
                frame
            }
        }
    }
    
    @ViewBuilder
    func TextView(
        _ alignment: Alignment,
        offset: CGFloat,
        opacity: CGFloat
    ) -> some View {
        Text(text)
            .mask {
                if alignment == .top {
                    VStack(spacing: 0) {
                        Rectangle()
                        
                        ExtendedSpacer()
                        
                        ExtendedSpacer()
                    }
                } else if alignment == .center {
                    VStack(spacing: 0) {
                        ExtendedSpacer()
                        
                        Rectangle()
                    
                        ExtendedSpacer()
                    }
                } else {
                    VStack(spacing: 0) {
                        ExtendedSpacer()
                        
                        ExtendedSpacer()
                        
                        Rectangle()
                    }
                }
            }
            .shadow(
                color: shadow.opacity(opacity),
                radius: radius,
                x: offset,
                y: offset / 2
            )
            .offset(x: offset)
    }
    
    @ViewBuilder
    func ExtendedSpacer() -> some View {
        Spacer(minLength: 0)
            .frame(maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
