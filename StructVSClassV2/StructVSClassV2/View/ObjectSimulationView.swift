import SwiftUI

struct ObjectSimulationView: View {
    @ObservedObject var viewModel: ObjectSimulatorViewModel

    var body: some View {
        VStack(spacing: 40) {
            Text("Type: \(viewModel.original.kind == .structType ? "Struct" : "Class")")
                .font(.title)

            HStack(spacing: 40) {
                MemoryBoxView(box: viewModel.original, color: .blue)

                if viewModel.showArrow {
                    ArrowView()
                }

                if let copied = viewModel.copied {
                    MemoryBoxView(box: copied,
                                  color: viewModel.original.kind == .structType ? .green : .orange)
                }
            }

            HStack(spacing: 20) {
                Button("Simulate Copy") {
                    viewModel.simulateCopy()
                }
                .buttonStyle(.borderedProminent)

                Button("Toggle to \(viewModel.original.kind == .structType ? "Class" : "Struct")") {
                    viewModel.toggleKind()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}
