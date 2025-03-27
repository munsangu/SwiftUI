import SwiftUI

struct WaveModel: Identifiable, Equatable {
    let id = UUID()
    var color: Color
    var amplitude: CGFloat
    var isReversed: Bool
    
    init(
        color: Color = .blue,
        amplitude: CGFloat = 100,
        isReversed: Bool = false
    ) {
        self.color = color
        self.amplitude = amplitude
        self.isReversed = isReversed
    }
    
    static func defaultWaves() -> [WaveModel] {
        return [
            WaveModel(
                color: .purple.opacity(0.8),
                amplitude: 150,
                isReversed: false
            ),
            WaveModel(
                color: .cyan.opacity(0.4),
                amplitude: 140,
                isReversed: true
            )
        ]
    }
    
    static func == (
        lhs: WaveModel,
        rhs: WaveModel
    ) -> Bool {
        return lhs.id == rhs.id &&
            lhs.color == rhs.color &&
            lhs.amplitude == rhs.amplitude &&
            lhs.isReversed == rhs.isReversed
    }
}
