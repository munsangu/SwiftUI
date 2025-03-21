import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DisintegrationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image(.thanos)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: 500,
                            height: 500
                        )
                        .clipped()
                        .disintegrationEffect(
                            isDeleted: viewModel.snapEffect,
                            isReintegrating: viewModel.reintegrateEffect,
                            isVisible: !viewModel.isRemoved || viewModel.reintegrateEffect
                        ) {
                            viewModel.handleEffectCompletion()
                        }
                }
                .frame(height: 500)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button("Goodbye Thanos") {
                        viewModel.startDisintegration()
                    }
                    .disabled(viewModel.isProcessing || viewModel.isRemoved)
                    
                    Button("Welcome Thanos") {
                        viewModel.startReintegration()
                    }
                    .disabled(viewModel.isProcessing || !viewModel.isRemoved)
                }
                
                Spacer()
            }
            .navigationTitle("Disintegration Effect")
        }
    }
}

#Preview {
    ContentView()
}
