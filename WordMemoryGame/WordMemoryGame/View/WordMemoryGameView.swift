import SwiftUI

struct WordMemoryGameView: View {
    @StateObject var viewModel = WordGameViewModel()
    var body: some View {
        NavigationStack {
            LazyVGrid(
                columns: Array(
                    repeating: .init(.flexible()),
                    count: 2
                ),
                spacing: 40) {
                ForEach(
                    viewModel.wordsToShow,
                    id: \.self
                ) { word in
                    Text(word)
                        .frame(
                            maxWidth: .infinity,
                            minHeight: 80
                        )
                        .background(Color.yellow.opacity(0.8))
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Remember the words")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    viewModel.startQuiz()
                }
            }
            .navigationDestination(isPresented: $viewModel.isQuizStarted) {
                WordQuizView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    NavigationStack {
        WordMemoryGameView()
    }
}
