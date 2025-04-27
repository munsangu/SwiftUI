import SwiftUI

struct NormalExampleView: View {
    @ObservedObject var viewModel: SnapshotViewModel
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hello, world!")
            }
            .foregroundStyle(.white)
            .padding()
            .background(
                .red.gradient,
                in: RoundedRectangle(cornerRadius: 15)
            )
            .snapshot(trigger: viewModel.triggerSnapshot) { image in
                viewModel.setSnapshot(image)
            }
        }
        .padding()
        .navigationTitle("Normal View Example")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Snapshot") {
                    viewModel.takeSnapshot()
                }
            }
        }
    }
}
