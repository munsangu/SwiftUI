import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var animateOffset: CGSize = .zero

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .blue.opacity(0.3),
                    .purple.opacity(0.3)
                ],
                startPoint: .top,
                endPoint: .bottom
                )
                .ignoresSafeArea()
            
            VStack {
                Text("Time: \(String(format: "%.1f", viewModel.elapsedTime)) Seconds")
                    .font(.title2)
                    .padding(.top)

                Spacer()

                ZStack {
                    ForEach(
                        Array(
                            viewModel.gameItems.prefix(4).enumerated()),
                            id: \.element.id
                    ) { index, item in
                        GameItemView(item: item)
                            .opacity(opacityForIndex(index))
                            .scaleEffect(scaleForIndex(index))
                            .offset(y: offsetYForIndex(index))
                            .offset(index == 0 ? animateOffset : .zero)
                            .zIndex(Double(10 - index))
                            .animation(
                                index == 3 ? .easeOut(duration: 0.4) : .none,
                                value: viewModel.gameItems
                            )
                    }
                }
                .frame(height: 400)

                Spacer()

                HStack(spacing: 40) {
                    Button {
                        animateOut(.A)
                    } label: {
                        Text("A")
                            .font(.largeTitle.bold())
                            .foregroundColor(.red)
                            .frame(
                                width: 140,
                                height: 60
                            )
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(16)
                    }

                    Button {
                        animateOut(.B)
                    } label: {
                        Text("B")
                            .font(.largeTitle.bold())
                            .foregroundColor(.blue)
                            .frame(
                                width: 140,
                                height: 60
                            )
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(16)
                    }
                }

                if viewModel.isGameOver {
                    Text("Game Clear!")
                        .foregroundColor(.green)
                        .padding(.top, 20)
                }
            }
            .padding()
        }
    }
    

    private func animateOut(_ type: GameType) {
        guard let current = viewModel.gameItems.first, current.type == type else { return }

        let direction: CGFloat = type == .A ? -300 : 300
        withAnimation {
            animateOffset = CGSize(
                width: direction,
                height: 0
            )
        }

        viewModel.processUserInput(for: type) {
            animateOffset = .zero
        }
    }

    private func opacityForIndex(_ index: Int) -> Double {
        switch index {
        case 0: return 1.0
        case 1: return 0.5
        case 2: return 0.3
        case 3: return 0
        default: return 0
        }
    }

    private func scaleForIndex(_ index: Int) -> CGFloat {
        switch index {
        case 0: return 1.0
        case 1: return 0.7
        case 2: return 0.5
        case 3: return 0.3
        default: return 0.3
        }
    }

    private func offsetYForIndex(_ index: Int) -> CGFloat {
        switch index {
        case 0: return 0
        case 1: return -80
        case 2: return -160
        case 3: return -240
        default: return -300
        }
    }
}

//#Preview {
//    GameView()
//}
