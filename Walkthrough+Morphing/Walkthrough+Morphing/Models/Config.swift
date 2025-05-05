import SwiftUI

struct Config {
    var font: Font
    var frame: CGSize
    var radius: CGFloat
    var foregroundColor: Color
    var keyFrameDuration: CGFloat = 0.4
    var symbolAnimation: Animation = .smooth(duration: 0.5, extraBounce: 0)
}
