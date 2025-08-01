import SwiftUI

struct LoadingIndicator: View {
    @State private var isAnimating: Bool = false
    @State private var colors: [Color] = Array(
        repeating: .blue,
        count: 12
    )
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4)
                .fill(Color.clear)
                .frame(
                    width: 100,
                    height: 100
                )
                .overlay (
                    Circle()
                        .stroke(
                            Color.gray.opacity(0.1),
                            lineWidth: 4
                        )
                )
            
            ForEach(0..<12) { index in
                Circle()
                    .fill(colors[index])
                    .frame(
                        width: 10,
                        height: 10
                    )
                    .offset(y: -50)
                    .rotationEffect(.degrees(30 * Double(index)))
                    .opacity(isAnimating ? 1 : 0.2)
                    .animation(
                        .easeInOut(duration: 0.6)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.05),
                        value: isAnimating
                    )
            }
        }
        .rotationEffect(.degrees(isAnimating ? 360 : 0))
        .animation(
            .linear(duration: 1)
            .repeatForever(autoreverses: false),
            value: isAnimating
        )
        .onAppear {
            isAnimating = true
            
            startColorChange()
        }
        
        Text("Loading")
            .font(.title2)
            .opacity(isAnimating ? 1 : 0.3)
            .animation(
                .easeInOut(duration: 0.8)
                .repeatForever(autoreverses: true),
                value: isAnimating
            )
            .padding(
                .top,
                200
            )
            .foregroundStyle(.white)
    }
    
    private func startColorChange() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            for i in 0..<colors.count {
                colors[i] = Color(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1)
                )
            }
        }
    }
}

#Preview {
    LoadingIndicator()
}
