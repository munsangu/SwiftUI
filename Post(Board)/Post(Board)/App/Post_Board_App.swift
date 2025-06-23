import SwiftUI
import SwiftData

@main
struct Post_Board_App: App {
    var body: some Scene {
        WindowGroup {
            PostListView()
        }
        .modelContainer(for: Post.self)
    }
}
