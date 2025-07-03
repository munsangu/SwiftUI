import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StructVsClassViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        viewModel.isShowingCommon = true
                    }) {
                        Text("Common")
                            .padding()
                            .background(viewModel.isShowingCommon ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        viewModel.isShowingCommon = false
                    }) {
                        Text("Difference")
                            .padding()
                            .background(!viewModel.isShowingCommon ? Color.blue : Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                if !viewModel.isShowingCommon {
                    Image("struct_class_diagram")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .transition(.opacity)
                }

                List(viewModel.filteredItems) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
            .navigationTitle("Struct vs Class")
        }
    }
}

#Preview {
    ContentView()
}
