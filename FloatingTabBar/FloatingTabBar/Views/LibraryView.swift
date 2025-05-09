import SwiftUI

struct LibraryView: View {
    var tabBarHeight: CGFloat
    @State private var hideTabBar: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 0)
                
                Button("Hide Tab Bar") {
                    hideTabBar.toggle()
                }
            }
            .padding()
            .navigationTitle("Library")
            .safeAreaPadding(
                .bottom,
                tabBarHeight
            )
        }
        .hideFloatingTabBar(hideTabBar)
    }
}
