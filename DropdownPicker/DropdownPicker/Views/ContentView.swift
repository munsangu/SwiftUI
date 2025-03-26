import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DropdownViewModel()
    @State private var config: DropdownConfig = .init(activeText: "")
    
    var body: some View {
        NavigationStack {
            List {
                SourceDropdownView(viewModel: viewModel, config: $config)
                    .listRowInsets(.init(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0
                        )
                    )
            }
            .navigationTitle("Dropdown")
            .onAppear {
                if config.activeText.isEmpty {
                    config.activeText = viewModel.defaultSelection
                }
            }
        }
        .dropdownOverlay(
            $config,
            values: viewModel.pickerValues,
            viewModel: viewModel
        )
    }
}

#Preview {
    ContentView()
}

// README.md

