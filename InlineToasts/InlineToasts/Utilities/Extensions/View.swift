import SwiftUI

extension View {
    func inlineToast (
        alignment: Alignment,
        config: InlineToastConfig,
        isPresented: Bool
    ) -> some View {
        VStack(spacing: 10) {
            if config.anchor == .bottom {
                self
                    .compositingGroup()
                    .frame(
                        maxWidth: .infinity,
                        alignment: alignment
                    )
            }
            
            if config.anchor == .top {
                self
                    .compositingGroup()
                    .frame(
                        maxWidth: .infinity,
                        alignment: alignment
                    )
            }
            
            if isPresented {
                InlineToastView(config: config)
                    .transition(CustomTransition(anchor: config.animationAnchor))
            }
        }
        .clipped()
    }
}
