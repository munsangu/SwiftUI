import SwiftUI

struct PostEditView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var title: String = ""
    @State private var content: String = ""
    var existingPost: Post?

    var body: some View {
        NavigationStack {
            Form {
                TextField(
                    "Title",
                    text: $title
                )
                
                TextEditor(text: $content)
                    .frame(minHeight: 200)
            }
            .navigationTitle(existingPost == nil ? "New Post" : "Edit Post")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let post = existingPost {
                            post.title = title
                            post.content = content
                        } else {
                            let newPost = Post(
                                title: title,
                                content: content
                            )
                            context.insert(newPost)
                        }
                        try? context.save()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onAppear {
                if let post = existingPost {
                    title = post.title
                    content = post.content
                }
            }
        }
    }
}
