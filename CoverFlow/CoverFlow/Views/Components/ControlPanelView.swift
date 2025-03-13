import SwiftUI

struct ControlPanelView: View {
    @ObservedObject var viewModel: CoverFlowViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Toggle(
                "Toggle Reflection",
                isOn: $viewModel.enableReflection
            )
            
            Text("Card Spacing")
                .font(.caption2)
                .foregroundStyle(.gray)
            
            Slider(value: $viewModel.spacing, in: -120...20)
            
            Text("Card Rotation")
                .font(.caption2)
                .foregroundStyle(.gray)
            
            Slider(value: $viewModel.rotation, in: 0...100)
        }
        .padding(15)
        .background(
            .ultraThinMaterial,
            in: .rect(cornerRadius: 10)
        )
        .padding(15)
    }
}
