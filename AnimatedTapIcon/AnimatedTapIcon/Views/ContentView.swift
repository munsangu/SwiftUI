import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            TabScreensContainer(viewModel: viewModel)
            
            BounceDirectionSelector(viewModel: viewModel)
            
            CustomTabBar(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}
