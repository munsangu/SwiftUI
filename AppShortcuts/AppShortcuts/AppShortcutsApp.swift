import SwiftUI

@main
struct AppShortcutsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memory.self)
        }
    }
}
