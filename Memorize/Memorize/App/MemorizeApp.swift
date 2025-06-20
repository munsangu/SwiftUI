import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var viewModel = MemorizeGameViewModel()
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: viewModel)
        }
    }
}
