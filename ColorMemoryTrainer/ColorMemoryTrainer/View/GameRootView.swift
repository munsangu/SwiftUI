import SwiftUI
import SwiftData

struct GameRootView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        TabView {
            GameView(viewModel: viewModel)
                .tabItem {
                    Label(
                        "Game",
                        systemImage: "gamecontroller"
                    )
                }
            LeaderboardView()
                .tabItem {
                    Label(
                        "Leaderboard",
                        systemImage: "list.number"
                    )
                }
        }
        .onAppear {
            viewModel.setContext(context)
        }
    }
}
