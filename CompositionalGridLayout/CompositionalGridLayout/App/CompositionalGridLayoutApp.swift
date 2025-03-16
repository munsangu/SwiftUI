import SwiftUI

@main
struct CompositionalGridLayoutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: GridViewModel())
        }
    }
}
