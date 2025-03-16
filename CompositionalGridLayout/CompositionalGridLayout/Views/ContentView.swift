import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: GridViewModel
    
    init(viewModel: GridViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: viewModel.spacing) {
                    PickerView(selectedCount: $viewModel.columnCount)
                    
                    CompositionalLayout(columnCount: viewModel.columnCount, spacing: viewModel.spacing) {
                        ForEach(viewModel.items) { item in
                            GridItemView(item: item)
                        }
                    }
                    .animation(
                        .bouncy,
                        value: viewModel.columnCount
                    )
                }
                .padding(15)
            }
            .navigationTitle("Compositional Grid")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView(viewModel: GridViewModel())
}
