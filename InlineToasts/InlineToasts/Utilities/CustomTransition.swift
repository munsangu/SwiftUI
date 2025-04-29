import SwiftUI

struct CustomTransition: Transition {
    var anchor: InlineToastConfig.InlineToastAnchor
    
    func body(
        content: Content,
        phase: TransitionPhase
    ) -> some View {
        content
            .visualEffect { [phase] content, proxy in
                content
                    .offset(y:
                        offset(
                            proxy,
                            phase: phase
                        )
                    )
            }
            .clipped()
    }
    
    func offset(
        _ proxy: GeometryProxy,
        phase: TransitionPhase
    ) -> CGFloat {
        let height = proxy.size.height + 10
        return anchor == .top ?
        (phase.isIdentity ? 0 : -height) :
        (phase.isIdentity ? 0 : height)
    }
}
