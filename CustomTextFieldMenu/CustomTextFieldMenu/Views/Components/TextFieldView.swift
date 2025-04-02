import SwiftUI

struct TextFieldView: View {
    @ObservedObject var viewModel: ContentViewModel
    var placeholder: String
    @Binding var text: String
    @Binding var selection: TextSelection?
    @Binding var showSuggestions: Bool
    
    init(
        viewModel: ContentViewModel,
        placeholder: String,
        text: Binding<String>,
        selection: Binding<TextSelection?>,
        showSuggestions: Binding<Bool>
    ) {
        self.viewModel = viewModel
        self.placeholder = placeholder
        self._text = text
        self._selection = selection
        self._showSuggestions = showSuggestions
    }
    
    var body: some View {
        TextField(
            placeholder,
            text: $text,
            selection: $selection
        )
        .menu(showSuggestions: showSuggestions) {
            viewModel.uppercaseAction()
            viewModel.lowercaseAction()
        }
    }
}

#Preview {
    TextFieldView(
        viewModel: ContentViewModel(),
        placeholder: "Input",
        text: .constant("Sample Test"),
        selection: .constant(nil),
        showSuggestions: .constant(true)
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
