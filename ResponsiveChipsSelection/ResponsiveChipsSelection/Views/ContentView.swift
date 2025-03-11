import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ChipsViewModel
    
    init() {
        let tags = ["iOS 18", "SwiftUI", "macOS", "watchOS", "tvOS", "Xcode", "macCatalyst", "UIKit", "AppKit", "CocoaPods", "Objective-C"]
        _viewModel = StateObject(wrappedValue: ChipsViewModel(tags: tags))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if !viewModel.selectedChips.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Selected Tags:")
                            .font(.headline)
                        
                        Text(viewModel.getSelectedTitles().joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.green.opacity(0.1))
                    )
                }
                
                Spacer()
            }
            .padding(15)
            .navigationTitle("Chips Selection")
            .onAppear {
                viewModel.onSelectionChanged = { selectedChips in
                    print("SelectedTags: \(selectedChips.map { $0.title })")
                }
            }
            
            ChipsView(viewModel: viewModel) { chip in
                ChipView(
                    chip: chip,
                    isSelected: viewModel.isSelected(chip)
                )
            }
            .padding(10)
            .background(
                .gray.opacity(0.1),
                in: .rect(cornerRadius: 20)
            )
        }
    }
}

#Preview {
    ContentView()
}
