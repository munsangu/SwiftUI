import SwiftUI

struct TextFieldAction {
    var title: String
    var action: (NSRange, UITextField) -> Void
}

struct TextFieldState {
    var text: String = ""
    var selection: TextSelection? = nil
    var showSuggestions: Bool = false
}
