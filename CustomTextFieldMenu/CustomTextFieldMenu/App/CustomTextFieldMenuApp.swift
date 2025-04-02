import SwiftUI

@main
struct CustomTextFieldMenuApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
