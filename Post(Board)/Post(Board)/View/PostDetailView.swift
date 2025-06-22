import SwiftUI

struct PostDetailView: View {
    @EnvironmentObject var viewModel: PostViewModel
    @Environment(\.dismiss) var dismiss
    let post: Post
    @State private var showEdit = false
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            Text(post.title).font(.title).bold()
            
            Text(post.createdAt.formatted()).font(.caption).foregroundColor(.gray)

            Divider()

            ScrollView {
                Text(post.content)
            }

            Spacer(minLength: 0)
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") {
                showEdit = true
            }
        }
        .sheet(isPresented: $showEdit) {
            PostEditView(existingPost: post)
        }
    }
}
