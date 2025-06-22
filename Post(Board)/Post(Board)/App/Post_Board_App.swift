import SwiftUI

@main
struct Post_Board_App: App {
    @StateObject private var viewModel = PostViewModel()
    var body: some Scene {
        WindowGroup {
            PostListView()
                .environmentObject(viewModel)
        }
    }
}
