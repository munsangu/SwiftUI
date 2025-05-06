import SwiftUI

struct ContentView: View {
    @State private var isAnimated: Bool = false
    @State private var b: CGFloat = 0
    @State private var c: CGFloat = 0
    var body: some View {
        VStack(spacing: 20) {
            IsometricView(depth: isAnimated ? 35 : 0) {
                ImageView()
            } bottom: {
                ImageView()
            } side: {
                ImageView()
            }
            .frame(
                width: 180,
                height: 330
            )
            .modifier(
                CustomProjection(
                    b: b,
                    c: c
                )
            )
            .rotation3DEffect(
                .init(degrees: isAnimated ? 45 : 0),
                axis: (0, 0, 1)
            )
            .scaleEffect(0.75)
            .offset(x: isAnimated ? 12 : 0)
            
            VStack(
                alignment: .leading,
                spacing: 25
            ) {
                Text("Isometric Transform's")
                    .font(.title.bold())
                
                HStack {
                    Button("Animate") {
                        withAnimation(
                            .easeInOut(duration: 2.5)
                        ) {
                            isAnimated = true
                            b = -0.2
                            c = -0.3
                        }
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    
                    Button("Reset") {
                        withAnimation(
                            .interactiveSpring(
                                response: 0.4,
                                dampingFraction: 0.5,
                                blendDuration: 0.5
                            )
                        ) {
                            isAnimated = false
                            b = 0
                            c = 0
                        }
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            }
            .padding(
                .horizontal,
                15
            )
            .padding(
                .top,
                20
            )
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
}

#Preview {
    ContentView()
}
