import SwiftUI

struct GlitchFrame: Animatable {
    var animatableData: AnimatablePair<
        CGFloat,
            AnimatablePair<
                CGFloat,
                    AnimatablePair<
                        CGFloat,
                            CGFloat
                    >
            >
    > {
        get {
            return .init(
                    top,
                    .init(
                        center,
                        .init(
                            bottom,
                            shadowOpacity
                            )
                    )
            )
        }
        
        set {
            top = newValue.first
            center = newValue.second.first
            bottom = newValue.second.second.first
            shadowOpacity = newValue.second.second.second
        }
    }
    
    var top: CGFloat = 0
    var center: CGFloat = 0
    var bottom: CGFloat = 0
    var shadowOpacity: CGFloat = 0
}
