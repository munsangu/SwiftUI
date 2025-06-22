import SwiftUI

struct PostEditView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: PostViewModel
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
                            var updated = post
                            updated.title = title
                            updated.content = content
                            viewModel.updatePost(updated)
                        } else {
                            viewModel.addPost(
                                title: title,
                                content: content
                            )
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
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
