import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    private var textBinding: Binding<String> {
        Binding(
            get: { viewModel.textFieldState.text },
            set: { viewModel.updateText($0) }
        )
    }
    
    private var selectionBinding: Binding<TextSelection?> {
        Binding(
            get: { viewModel.textFieldState.selection },
            set: { viewModel.updateSelection($0) }
        )
    }
    
    private var suggestionsBinding: Binding<Bool> {
        Binding(
            get: { viewModel.textFieldState.showSuggestions },
            set: { viewModel.updateSuggestions($0) }
        )
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("TextField") {
                    TextFieldView(
                        viewModel: viewModel,
                        placeholder: "Message",
                        text: textBinding,
                        selection: selectionBinding,
                        showSuggestions: suggestionsBinding
                    )
                }
                
                Section("Properties") {
                    HStack {
                        Text("Turn on Suggestions")
                        
                        Spacer(minLength: 0)
                        
                        Toggle(
                            "",
                            isOn: suggestionsBinding
                        )
                        .labelsHidden()
                    }
                }
                
                Section {
                    if let selection = viewModel.textFieldState.selection,
                        !selection.isInsertion
                    {
                        Text("Some Text is Selected")
                    }
                }
            }
            .navigationTitle("Custom TextField Menu")
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
