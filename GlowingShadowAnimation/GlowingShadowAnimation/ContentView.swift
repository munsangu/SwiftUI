import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack {
            RoundedRectangle(
                cornerRadius: 20,
                style: .continuous
            )
            .fill(
                AngularGradient(
                    colors: [.teal, .pink, .teal],
                    center: .center,
                    angle: .degrees(isAnimating ? 360 : 0)
                )
            )
            .frame(
                width: 260,
                height: 60
            )
            .blur(radius: 20)
            .onAppear {
                withAnimation(
                    .linear(duration: 5)
                    .repeatForever(autoreverses: false)
                ) {
                    isAnimating = true
                }
            }
            
            Button {
                
            } label: {
                Text("Get Premium")
                    .bold()
                    .font(.title3)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.black)
                    .frame(
                        width: 260,
                        height: 60
                    )
                    .background(
                        .teal,
                        in: .rect(
                            cornerRadius: 20,
                            style: .continuous
                        )
                    )
                    .overlay {
                        RoundedRectangle(
                            cornerRadius: 20,
                            style: .continuous
                        )
                        .stroke(
                            .gray.opacity(0.5),
                            lineWidth: 1
                        )
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
