import SwiftUI

struct CustomTextFieldWithKeyboard<TextField: View, Keyboard: View>: UIViewControllerRepresentable {
    @ViewBuilder var textField: TextField
    @ViewBuilder var keyboard: Keyboard
    
    func makeUIViewController(context: Context) -> UIHostingController<TextField> {
        let controller = UIHostingController(rootView: textField)
        controller.view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let textField = controller.view.allSubViews.first(where: { $0 is UITextField }) as? UITextField,
               textField.inputView == nil {
                let inputController = UIHostingController(rootView: keyboard)
                inputController.view.backgroundColor = .clear
                inputController.view.frame = .init(
                    origin: .zero,
                    size: inputController.view.intrinsicContentSize
                )
                
                textField.inputView = inputController.view
                textField.reloadInputViews()
            }
        }
        
        return controller
    }
    
    func updateUIViewController(
        _ uiViewController: UIHostingController<TextField>,
        context: Context
    ) {
        uiViewController.rootView = textField
    }
    
    func sizeThatFits(
        _ proposal: ProposedViewSize,
        uiViewController: UIHostingController<TextField>,
        context: Context
    ) -> CGSize? {
        return uiViewController.view.intrinsicContentSize
    }
}
