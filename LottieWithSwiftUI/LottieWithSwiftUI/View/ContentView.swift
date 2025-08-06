import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LottieView(
                animationName: "MotorcycleCourier",
                loopMode: .loop
            )
            .scaleEffect(0.4)
        }
    }
}

#Preview {
    ContentView()
}
