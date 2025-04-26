import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ShineViewModel(shineModel: ShineModel(duration: 0.8))
    
    var body: some View {
        NavigationStack {
            VStack {
                ImageView(viewModel: viewModel)
                
                Button(
                    "Share Image",
                    systemImage: "square.and.arrow.up"
                ) {
                    viewModel.toggleShine()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .padding(.vertical, 50)
                .padding(.horizontal, 20)
            }
            .navigationTitle("Shine Effect")
        }
    }
}
