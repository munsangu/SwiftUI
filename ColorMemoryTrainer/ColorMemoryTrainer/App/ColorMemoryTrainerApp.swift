import SwiftUI
import SwiftData

@main
struct ColorMemoryTrainerApp: App {
    var body: some Scene {
        WindowGroup {
            GameRootView()
        }
        .modelContainer(for: LeaderboardEntry.self)
    }
}
