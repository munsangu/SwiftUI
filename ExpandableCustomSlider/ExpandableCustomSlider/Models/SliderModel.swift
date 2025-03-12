import Foundation
import SwiftUI

struct SliderModel {
    var value: CGFloat
    var range: ClosedRange<CGFloat>
    var config: SliderConfig
    
    init(
        value: CGFloat = 30,
        range: ClosedRange<CGFloat> = 0...100,
        config: SliderConfig = SliderConfig()
    ) {
        self.value = value
        self.range = range
        self.config = config
    }
}

struct SliderConfig {
    var inActiveTint: Color = .black.opacity(0.06)
    var activeTint: Color = .blue
    var cornerRadius: CGFloat = 15
    var extraHeight: CGFloat = 25
    var overlayActiveTint: Color = .white
    var overlayInActiveTint: Color = .black
}
