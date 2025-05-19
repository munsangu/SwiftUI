import SwiftUI
import PencilKit

struct CanvasUIView: UIViewRepresentable {
    @ObservedObject var viewModel: CanvasViewModel
    
    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = viewModel.model.canvasView
        canvasView.backgroundColor = .white
        canvasView.drawingPolicy = .anyInput
        if let window = UIApplication.shared.windows.first {
            viewModel.model.toolPicker.setVisible(true, forFirstResponder: canvasView)
            viewModel.model.toolPicker.addObserver(canvasView)
            canvasView.becomeFirstResponder()
        }
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}
