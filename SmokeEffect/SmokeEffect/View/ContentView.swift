import SwiftUI
import SpriteKit

struct ContentView: View {
    @State private var scene = SmokeScene(size: CGSize(width: 300, height: 300))
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.black)
                .ignoresSafeArea()
            
            SpriteView(scene: scene)
                .frame(
                    width: 300,
                    height: 300
                )
                .onAppear {
                    scene.scaleMode = .resizeFill
                }
        }
    }
}

#Preview {
    ContentView()
}
