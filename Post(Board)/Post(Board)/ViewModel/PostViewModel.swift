import Foundation
import SwiftData

class PostViewModel: ObservableObject {
    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func addPost(
        title: String,
        content: String
    ) {
        let newPost = Post(
            title: title,
            content: content
        )
        context.insert(newPost)
        try? context.save()
    }

    func updatePost(
        _ post: Post,
        title: String,
        content: String
    ) {
        post.title = title
        post.content = content
        try? context.save()
    }

    func deletePost(_ post: Post) {
        context.delete(post)
        try? context.save()
    }
}
