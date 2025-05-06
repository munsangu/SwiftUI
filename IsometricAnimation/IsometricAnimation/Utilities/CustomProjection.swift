import SwiftUI

struct CustomProjection: GeometryEffect {
    var b: CGFloat
    var c: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            return AnimatablePair(b, c)
        }
        
        set {
            b = newValue.first
            c = newValue.second
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return .init(.init(1, b, c, 1, 0, 0))
    }
}
