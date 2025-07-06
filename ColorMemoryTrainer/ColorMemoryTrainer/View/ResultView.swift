import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: GameViewModel
    var body: some View {
        VStack(spacing: 10) {
            Text("Result")
                .font(.title2)
                .bold()
            
            Text("Correct: \(viewModel.score) / \(viewModel.sequence.count)")

            HStack {
                Text("Answer:")
                
                ForEach(
                    viewModel.sequence,
                    id: \.self
                ) { color in
                    Circle()
                        .fill(color.color)
                        .frame(
                            width: 30,
                            height: 30
                        )
                }
            }

            HStack(spacing: 20) {
                Button("Retry") {
                    viewModel.retry()
                }

                Button("Next Level") {
                    viewModel.nextLevel()
                }
            }
            .padding(
                .top,
                20
            )
        }
    }
}

#Preview {
    ResultView(viewModel: GameViewModel())
}
