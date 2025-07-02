import SwiftUI

@main
struct MVCApp: App {
    @StateObject private var viewModel = MVCViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
