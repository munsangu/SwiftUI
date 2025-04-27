import SwiftUI

struct NavigationExampleView: View {
    @ObservedObject var viewModel: SnapshotViewModel
    
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                Text("List Cell \(index)")
            }
        }
        .navigationTitle("List View")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Snapshot") {
                    viewModel.takeSnapshot()
                }
            }
        }
        .snapshot(trigger: viewModel.triggerSnapshot) { image in
            viewModel.setSnapshot(image)
        }
    }
}
