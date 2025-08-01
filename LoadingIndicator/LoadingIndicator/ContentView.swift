import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color
                .black
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            LoadingIndicator()
        }
    }
}

#Preview {
    ContentView()
}
