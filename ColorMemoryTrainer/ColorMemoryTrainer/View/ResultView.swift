import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.isCorrect ? "🎉 Perfect!" : "❌ Try Again")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            VStack(
                alignment: .leading,
                spacing: 12
            ) {
                Text("Correct Sequence:")
                    .font(.headline)
                
                HStack {
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

                Text("Your Sequence:")
                    .font(.headline)
                
                HStack {
                    ForEach(
                        viewModel.userSequence,
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
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)

            Text("Score: \(viewModel.score) / \(viewModel.sequence.count)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 4)

            HStack(spacing: 24) {
                Button(action: {
                    viewModel.retry()
                }) {
                    Text("🔄 Retry")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }

                Button(action: {
                    viewModel.nextLevel()
                }) {
                    Text("➡️ Next Level")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    ResultView(viewModel: GameViewModel())
}
