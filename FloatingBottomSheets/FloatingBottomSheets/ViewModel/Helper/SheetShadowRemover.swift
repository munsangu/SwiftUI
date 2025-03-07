import SwiftUI

struct SheetShadowRemover: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let uiSheetView = view.viewBeforeWindow {
                for view in uiSheetView.subviews {
                    view.layer.shadowColor = UIColor.clear.cgColor
                }
            }
        }
    
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
