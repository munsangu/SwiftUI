import SwiftUI
import SwiftData

struct PostListView: View {
    @Environment(\.modelContext) private var context
    @Query(
        sort: \Post.createdAt,
        order: .reverse
    ) private var posts: [Post]
    @State private var showCreate = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(posts) { post in
                    NavigationLink(destination: PostDetailView(post: post)) {
                        VStack(alignment: .leading) {
                            Text(post.title).font(.headline)
                            
                            Text(post.createdAt.formatted()).font(.caption).foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(posts[index])
                    }
                    try? context.save()
                }
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
