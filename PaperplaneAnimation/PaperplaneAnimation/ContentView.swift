import SwiftUI

struct ContentView: View {
    @State private var drawPath = false
    @State private var movePaperplane = false
    @State private var threeDRotate = false
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.white, .blue]),
                center: .center,
                startRadius: 2,
                endRadius: 500
            )
            .scaleEffect(1.2)
            
            Circle()
                .trim(
                    from: 0,
                    to: drawPath ? 1 : 0
                )
                .stroke(
                    .white,
                    style:
                        StrokeStyle(
                            lineWidth: 5,
                            dash: [10]
                        )
                )
                .frame(
                    width: 300,
                    height: 300
                )
                .rotationEffect(.degrees(180))
                .animation(
                    .linear(duration: 4)
                    .repeatForever(autoreverses: false),
                    value: drawPath
                )
                .onAppear {
                    self.drawPath.toggle()
                }
            
            Image(systemName: "paperplane.fill")
                .rotation3DEffect(
                    .degrees(threeDRotate ? -360 : 360),
                    axis: (x: 0, y: threeDRotate ? -1 : -5, z: 0)
                )
                .offset(x: -150)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(movePaperplane ? 0 : -360))
                .animation(
                    .linear(duration: 4)
                    .repeatForever(autoreverses: false),
                    value: movePaperplane
                )
                .animation(
                    .linear(duration: 4)
                    .repeatForever(autoreverses: false),
                    value: threeDRotate
                )
                .onAppear {
                    self.movePaperplane.toggle()
                    self.threeDRotate.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
