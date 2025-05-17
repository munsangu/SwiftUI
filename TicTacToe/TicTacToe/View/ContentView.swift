import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
        let columns: [GridItem] = Array(
                                            repeating: .init(.flexible()),
                                            count: 3
                                        )

        var body: some View {
            VStack(spacing: 20) {
                Text("Tic Tac Toe")
                    .font(.largeTitle)
                    .bold()
                
                LazyVGrid(
                    columns: columns,
                    spacing: 15
                ) {
                    ForEach(viewModel.board.indices, id: \.self) { index in
                        ZStack {
                            Rectangle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(
                                    width: 100,
                                    height: 100
                                )
                                .cornerRadius(15)
                            
                            Text(viewModel.board[index].player?.rawValue ?? "")
                                .font(
                                    .system(
                                        size: 48,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(.black)
                        }
                        .onTapGesture {
                            viewModel.tapCell(at: index)
                        }
                    }
                }

                if let winner = viewModel.winner {
                    Text("🎉 Player \(winner.rawValue) wins!")
                        .font(.title2)
                        .foregroundColor(.green)
                } else if viewModel.isDraw {
                    Text("🤝 It's a draw!")
                        .font(.title2)
                        .foregroundColor(.orange)
                } else {
                    Text("Current: \(viewModel.currentPlayer.rawValue)")
                        .font(.title2)
                }

                Button("Reset Game") {
                    viewModel.resetGame()
                }
                .padding()
                .background(Color.red.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
}

#Preview {
    ContentView()
}
