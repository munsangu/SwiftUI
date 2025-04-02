import SwiftUI

struct TextFieldActionHelper: UIViewRepresentable {
    var showSuggestions: Bool
    var actions: [TextFieldAction]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let textField = view.superview?.superview?.subviews.last?.subviews.first as? UITextField {
                context.coordinator.originalDelegate = textField.delegate
                textField.delegate = context.coordinator
            }
        }
        
        return view
    }
    
    func updateUIView(
        _ uiView: UIView,
        context: Context
    ) {
        context.coordinator.parent = self
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldActionHelper
        var originalDelegate: UITextFieldDelegate?
        
        init(parent: TextFieldActionHelper) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            originalDelegate?.textFieldDidChangeSelection?(textField)
        }
        
        func textField(
            _ textField: UITextField,
            editMenuForCharactersIn range: NSRange,
            suggestedActions: [UIMenuElement]) -> UIMenu?
        {
            var actions: [UIMenuElement] = []
            let customActions = parent.actions.compactMap { item in
                let action = UIAction(title: item.title) { _ in
                    item.action(
                        range,
                        textField
                    )
                }
                
                return action
            }
            
            if parent.showSuggestions {
                actions = customActions + suggestedActions
            } else {
                actions = customActions
            }
        
            return UIMenu(
                title: "",
                options: .displayInline,
                children: actions
            )
        }
    }
}
