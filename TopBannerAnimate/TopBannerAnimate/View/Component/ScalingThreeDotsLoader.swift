import SwiftUI

struct ScalingThreeDotsLoader: View {
    @State private var isAnimating = false
    @State var foregroundColor = Color(
        red: 0.51,
        green: 0.38,
        blue: 0.94,
        opacity: 0.55
    )
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .frame(
                        width: 20,
                        height: 20
                    )
                    .scaleEffect(isAnimating ? 1.0 : 0.5)
                    .animation(
                        .easeInOut(duration: 0.8)
                        .repeatForever()
                        .delay(0.3 * Double(index)),
                        value: UUID()
                    )
                    .foregroundColor(foregroundColor)
            }
        }
        .onAppear {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        withAnimation {
            isAnimating = true
        }
    }
}

#Preview {
    ScalingThreeDotsLoader()
}
