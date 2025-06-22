import SwiftUI

struct PostCreateView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: PostViewModel
    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("제목", text: $title)
                TextEditor(text: $content)
                    .frame(minHeight: 150)
            }
            .navigationTitle("새 글 작성")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("저장") {
                        if !title.isEmpty {
                            viewModel.addPost(
                                title: title,
                                content: content
                            )
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소") {
                        dismiss()
                    }
                }
            }
        }
    }
}
