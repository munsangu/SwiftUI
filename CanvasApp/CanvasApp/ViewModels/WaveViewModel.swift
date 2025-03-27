import SwiftUI

class WaveViewModel: ObservableObject, Identifiable {
    @Published private(set) var waveModel: WaveModel
    var id: UUID { waveModel.id }
    var color: Color { waveModel.color }
    var amplitude: CGFloat { waveModel.amplitude }
    var isReversed: Bool { waveModel.isReversed }
    
    init(model: WaveModel) {
        self.waveModel = model
    }
    
    func updateModel(with model: WaveModel) {
        self.waveModel = model
    }
    
    func getPath(size: CGSize) -> Path {
        return Path { path in
            let midHeight = size.height / 2
            let width = size.width
            
            path.move(
                to: CGPoint(
                    x: 0,
                    y: midHeight
                )
            )
            
            path.addCurve(
                to: CGPoint(
                    x: width,
                    y: midHeight
                ),
                control1: CGPoint(
                    x: width * 0.5,
                    y: midHeight + amplitude
                ),
                control2: CGPoint(
                    x: width * 0.5,
                    y: midHeight - amplitude
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: width,
                    y: size.height
                )
            )
            
            path.addLine(
                to: CGPoint(
                    x: 0,
                    y: size.height
                )
            )
        }
    }
}
