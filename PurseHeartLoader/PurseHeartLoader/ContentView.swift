import SwiftUI

struct ContentView: View {
    @State private var isPulsating = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size: 100))
                .scaleEffect(isPulsating ? 1.5 : 1.0)
                .animation(
                    .easeInOut(duration: 0.8)
                    .repeatForever(autoreverses: true)
                    ,value: isPulsating
                )
        }
        .onAppear {
            isPulsating = true
        }
    }
}

#Preview {
    ContentView()
}
