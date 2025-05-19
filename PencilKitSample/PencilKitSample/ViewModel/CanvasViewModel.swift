import PencilKit
import SwiftUI

class CanvasViewModel: ObservableObject {
    @Published var model = CanvasModel()
    
    func clearCanvas() {
        model.canvasView.drawing = PKDrawing()
    }

    func exportImage() -> UIImage? {
        let imageBounds = model.canvasView.bounds
        return model.canvasView.drawing.image(from: imageBounds, scale: 1.0)
    }
}
