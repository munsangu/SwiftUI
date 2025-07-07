import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    var body: some View {
        VStack(spacing: 20) {
            Text("🎨 Color Memory Trainer")
                .font(.title)
                .bold()

            switch viewModel.phase {
            case .preview:
                Text("Memorize the colors!")
                
                HStack {
                    ForEach(
                        Array(viewModel.sequence.enumerated()),
                        id: \.offset
                    ) { index, gameColor in
                        Circle()
                            .fill(gameColor.color)
                            .frame(
                                width: viewModel.highlightIndex == index ? 80 : 50,
                                height: viewModel.highlightIndex == index ? 80 : 50
                            )
                            .scaleEffect(viewModel.highlightIndex == index ? 1.3 : 1.0)
                            .animation(
                                .easeInOut(duration: 0.3),
                                value: viewModel.highlightIndex
                            )
                    }
                }

            case .input:
                Text("Repeat the sequence!")
                
                ColorButtonsGrid(viewModel: viewModel)
            case .result:
                ResultView(viewModel: viewModel)
            }

            Spacer()
        }
        .padding()
    }
}


#Preview {
    GameView()
}
