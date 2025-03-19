import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TransactionViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                AnimatedButton(config: viewModel.buttonConfig) {
                    await viewModel.processTransaction()
                }
            }
            .padding()
            .navigationTitle("Async Button")
        }
    }
}

#Preview {
    ContentView()
}
