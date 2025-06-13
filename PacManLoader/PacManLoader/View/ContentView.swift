import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            
            VStack {
                PacMan()
                    .frame(
                        width: 200,
                        height: 200
                    )
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
