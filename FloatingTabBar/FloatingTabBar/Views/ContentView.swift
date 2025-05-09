import SwiftUI

struct ContentView: View {
    @State private var activeTab: AppTab = .library
    var body: some View {
        FloatingTabView(selection: $activeTab) { tab, tabBarHeight in
            switch tab {
            case .memories:
                Text("Memories")
            case .library:
                LibraryView(tabBarHeight: tabBarHeight)
            case .albums:
                Text("Albums")
            case .search:
                Text("Search")
            }
        }
    }
}

#Preview {
    ContentView()
}
