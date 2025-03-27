import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(viewModel.waves.indices, id: \.self) { index in
                    WaveFormView(
                        viewModel: WaveViewModel(
                            model: viewModel.waves[index]
                        )
                    )
                }
            }
            
            HeaderView(
                title: "Wave's",
                isToggleOn: $viewModel.colorToggleEnabled
            )
        }
        .ignoresSafeArea(
            .all,
            edges: .bottom
        )
    }
}

#Preview {
    ContentView()
}
