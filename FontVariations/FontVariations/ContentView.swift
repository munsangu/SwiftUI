import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer(minLength: 0)
            
            Text("SwiftUI Font")
                .font(.largeTitle)
                .fontWeight(.black)
                .fontWidth(.expanded)
                .fontDesign(.serif)
            
            Text("SwiftUI Font")
                .font(.title2)
                .fontWeight(.bold)
                .fontWidth(.compressed)
                .fontDesign(.rounded)
            
            Text("SwiftUI Font")
                .font(.title3)
                .fontWeight(.regular)
                .fontWidth(.condensed)
                .fontDesign(.monospaced)
            
            Text("SwiftUI Font")
                .font(.body)
                .fontWeight(.ultraLight)
                .fontWidth(.standard)
                .fontDesign(.default)
            
            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
