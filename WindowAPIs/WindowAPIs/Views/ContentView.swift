import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Floating Window") {
                openWindow(id: "FloatingWindow")
            }
            
            Button("Xcode Like Build Window") {
                openWindow(id: "AlertWindow")
            }
        }
    }
}

#Preview {
    ContentView()
}
