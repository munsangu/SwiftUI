import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: Movie.self)
    }
  }
}
