import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            PolygonView()
                .navigationTitle("Dynamic Polygon Animation")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
