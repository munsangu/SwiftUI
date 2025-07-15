import SwiftUI
import SwiftData

@main
struct ColorMemoryTrainerApp: App {
    var body: some Scene {
        WindowGroup {
            RootLauncherView()
        }
        .modelContainer(for: LeaderboardEntry.self)
    }
}
