import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterCountViewModel()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Enter your text:")
                    .font(.headline)

                TextEditor(text: $viewModel.inputText)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .frame(height: 150)

                Text("Character Count: \(viewModel.characterCount)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding()
            .navigationTitle("Character Counter")
        }
    }
}

#Preview {
    ContentView()
}
