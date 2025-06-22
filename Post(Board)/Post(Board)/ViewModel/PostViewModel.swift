import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = [] {
        didSet {
            savePosts()
        }
    }

    private let storageKey = "SavedPosts"

    init() {
        loadPosts()
    }

    func addPost(
        title: String,
        content: String
    ) {
        let newPost = Post(
            title: title,
            content: content
        )
        posts.insert(newPost, at: 0)
    }

    func updatePost(_ updated: Post) {
        if let index = posts.firstIndex(where: { $0.id == updated.id }) {
            posts[index] = updated
        }
    }

    func deletePost(at offsets: IndexSet) {
        posts.remove(atOffsets: offsets)
    }

    private func savePosts() {
        if let encoded = try? JSONEncoder().encode(posts) {
            UserDefaults.standard.set(
                encoded,
                forKey: storageKey
            )
        }
    }

    private func loadPosts() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode(
            [Post].self,
            from: data
           ) {
            self.posts = decoded
        }
    }
}
