import SwiftUI

struct WordQuizView: View {
    @ObservedObject var viewModel: WordGameViewModel
    @State private var inputWord: String = ""
    @State private var resultMessage: String = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("Enter the word you remember")
                .font(.headline)

            TextField(
                "Enter word",
                text: $inputWord
            )
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("Submit") {
                resultMessage = viewModel.checkAnswer(word: inputWord)
                inputWord = ""
            }
            .buttonStyle(.bordered)

            Text(resultMessage)
                .font(.body)
                .foregroundColor(.blue)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    WordQuizView(viewModel: WordGameViewModel())
}
