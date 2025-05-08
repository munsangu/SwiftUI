import SwiftUI

struct WaveformShape: Shape {
    var samples: [Float]
    var spacing: Float = 2
    var width: Float = 2
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            var x: CGFloat = 0
            for sample in samples {
                let height = max(CGFloat(sample) * rect.height, 1)
                
                path.addRect(
                    CGRect(
                        origin: .init(
                            x: x + CGFloat(width),
                            y: -height / 2
                        ),
                        size: .init(
                            width: CGFloat(width),
                            height: height
                        )
                    )
                )
                
                x += CGFloat(spacing + width)
            }
        }
        .offsetBy(dx: 0, dy: rect.height / 2)
    }
}
