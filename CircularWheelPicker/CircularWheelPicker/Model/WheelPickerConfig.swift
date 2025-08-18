import SwiftUI

struct WheelPickerConfig {
    var activeTint: Color = .primary
    var inactiveTint: Color = .gray
    var largeTickFrequency: Int = 10
    var strokeStyle: StrokeStyle = .init(
        lineWidth: 50,
        lineCap: .round,
        lineJoin: .round
    )
    var strokeColor: Color = .black.opacity(0.1)
    var height: CGFloat = 200
}
