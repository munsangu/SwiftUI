import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ScalingThreeDotsLoaderViewModel()
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .frame(width: 20, height: 20)
                    .scaleEffect(viewModel.isAnimating ? 1.0 : 0.5)
                    .foregroundColor(viewModel.foregroundColor)
                    .animation(
                        .easeInOut(duration: 0.8)
                            .repeatForever()
                            .delay(0.3 * Double(index)),
                        value: viewModel.isAnimating
                    )
            }
        }
        .onAppear {
            viewModel.startAnimation()
        }
    }
}

#Preview {
    ContentView()
}
