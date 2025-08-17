import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ReactionViewModel()
        
        var body: some View {
            VStack(spacing: 40) {
                Text(titleText)
                    .font(.largeTitle)
                    .bold()
                
                Button(action: {
                    handleTap()
                }) {
                    ZStack {
                        Rectangle()
                            .fill(backgroundColor)
                            .frame(height: 300)
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        
                        Text(buttonText)
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            .padding()
        }
        
        private var titleText: String {
            switch viewModel.phase {
            case .idle:
                return "Reaction Time Game"
            case .waiting:
                return "Wait..."
            case .ready:
                return "Tap Now!"
            case .result(let reaction):
                if reaction == -1 {
                    return "Too Early 😅"
                } else {
                    return "Reaction Time: \(reaction) ms"
                }
            }
        }
        
        private var buttonText: String {
            switch viewModel.phase {
            case .idle:
                return "Start"
            case .waiting:
                return "..."
            case .ready:
                return "Tap!"
            case .result:
                return "Try Again"
            }
        }
        
        private var backgroundColor: Color {
            switch viewModel.phase {
            case .idle:
                return .blue
            case .waiting:
                return .red
            case .ready:
                return .green
            case .result:
                return .gray
            }
        }
        
        private func handleTap() {
            switch viewModel.phase {
            case .idle:
                viewModel.startGame()
            case .waiting, .ready:
                viewModel.userTapped()
            case .result:
                viewModel.resetGame()
            }
        }
}

#Preview {
    ContentView()
}
