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
                        viewModel.sequence,
                        id: \.self
                    ) { gameColor in
                        Circle()
                            .fill(gameColor.color)
                            .frame(
                                width: 50,
                                height: 50
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
        .animation(
            .easeInOut,
            value: viewModel.phase
        )
    }
}

#Preview {
    GameView()
}
