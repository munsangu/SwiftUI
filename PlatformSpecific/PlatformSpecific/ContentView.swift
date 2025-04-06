import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BlurView()
        }
        .platform(.iOS) { view in
            view
                .padding(25)
                .background(.red)
        }
        .platform(.macOS) { view in
            view
                .padding(10)
                .background(.yellow)
        }
        .platform(.tvOS) { view in
            view
                .padding(25)
                .background(.green)
        }
        .platform(.visionOS) { view in
            view
                .padding(25)
                .background(.blue)
        }
    }
}

#Preview {
    ContentView()
}
