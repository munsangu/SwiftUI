import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PinCodeViewModel(maxLength: 6)
    @FocusState private var isKeyboardActive: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Please enter the app pin code")
                    .font(.headline)

                CustomTextFieldWithKeyboard {
                    TextField(
                        "App Pin Code",
                        text: $viewModel.pinCode
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .frame(width: 150)
                    .background(.fill, in: .rect(cornerRadius: 12))
                    .focused($isKeyboardActive)
                } keyboard: {
                    KeyboardView(
                        viewModel: viewModel,
                        onDone: {
                            isKeyboardActive = false
                        }
                    )
                }
                
                if !viewModel.pinCode.isEmpty {
                    Text("\(viewModel.pinCode)")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
            }
            .padding()
            .navigationTitle("Custom Keyboard")
            .onChange(of: isKeyboardActive) { newValue in
                viewModel.isKeyboardActive = newValue
            }
        }
    }
}

#Preview {
    ContentView()
}
