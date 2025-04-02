import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var textFieldState = TextFieldState()
    
    func getTextFieldActions() -> [TextFieldAction] {
        return [
            uppercaseAction(),
            lowercaseAction()
        ]
    }
    
    func uppercaseAction() -> TextFieldAction {
        return TextFieldAction(title: "Uppercased") { [weak self] _, textField in
            self?.transformSelectedText(textField: textField) { $0.uppercased() }
        }
    }
    
    func lowercaseAction() -> TextFieldAction {
        return TextFieldAction(title: "Lowercased") { [weak self] _, textField in
            self?.transformSelectedText(textField: textField) { $0.lowercased() }
        }
    }
    
    private func transformSelectedText(textField: UITextField, transform: (String) -> String) {
        guard let selectionRange = textField.selectedTextRange,
              let selectedText = textField.text(in: selectionRange) else {
            return
        }
        
        let transformedText = transform(selectedText)
        textField.replace(selectionRange, withText: transformedText)
        textField.selectedTextRange = selectionRange
    }
    
    func updateText(_ text: String) {
        textFieldState.text = text
    }
    
    func updateSelection(_ selection: TextSelection?) {
        textFieldState.selection = selection
    }
    
    func toggleSuggestions() {
        textFieldState.showSuggestions.toggle()
    }
    
    func updateSuggestions(_ show: Bool) {
        textFieldState.showSuggestions = show
    }
}
