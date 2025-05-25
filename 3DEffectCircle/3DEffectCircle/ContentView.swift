import SwiftUI

struct ContentView: View {
    @State private var animate: Bool = false
    let size: CGFloat = 350
    let count: Int = 15
    var body: some View {
        ZStack {
            ForEach(
                0..<count,
                id: \.self
            ) { index in
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(
                        width: size * ((1.0 / Double(count)) * Double(index)),
                        height: size * ((1.0 / Double(count)) * Double(index))
                    )
                    .offset(y: (size / 2.5) * (1.0 / Double(count)) * Double(count - index))
                    .rotationEffect(.degrees(animate ? 360: 0))
                    .animation(
                        .linear(duration: 3)
                            .repeatForever(autoreverses: false),
                        value: animate
                    )
            }
        }
        .onAppear {
            withAnimation(.easeInOut) {
                animate.toggle()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
