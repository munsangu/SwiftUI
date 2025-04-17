import SwiftUI
import SwiftData

@main
struct PawsApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: Pet.self)
    }
  }
}
