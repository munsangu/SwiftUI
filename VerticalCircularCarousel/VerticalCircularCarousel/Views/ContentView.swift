import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            CardListView()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
