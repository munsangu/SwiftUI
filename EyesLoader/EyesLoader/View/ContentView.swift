import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            
            VStack (spacing: 20){
                Eyes()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
