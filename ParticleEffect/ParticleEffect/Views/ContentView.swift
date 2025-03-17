import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("Particle Effect")
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
