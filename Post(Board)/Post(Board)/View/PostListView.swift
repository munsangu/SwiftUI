import SwiftUI

struct PostListView: View {
    @EnvironmentObject var viewModel: PostViewModel
    @State private var showCreate = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.posts) { post in
                    NavigationLink(destination: PostDetailView(post: post)) {
                        VStack(alignment: .leading) {
                            Text(post.title).font(.headline)
                            
                            Text(post.createdAt.formatted()).font(.caption).foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: viewModel.deletePost)
            }
            .navigationTitle("Board")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showCreate = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showCreate) {
                PostEditView()
            }
        }
    }
}

#Preview {
    PostListView()
}
