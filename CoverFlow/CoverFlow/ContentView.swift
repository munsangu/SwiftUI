import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CoverFlowViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 0)
                
                CoverFlowView(
                    itemWidth: viewModel.itemWidth,
                    enableReflection: viewModel.enableReflection,
                    spacing: viewModel.spacing,
                    rotation: viewModel.rotation,
                    items: viewModel.items
                ) { item in
                    CoverFlowCardView(item: item)
                }
                .frame(height: 300)
                
                Spacer(minLength: 0)
                
                ControlPanelView(viewModel: viewModel)
            }
            .navigationTitle("CoverFlow")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
