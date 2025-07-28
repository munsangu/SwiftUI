import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            let safeAreaInsets = $0.safeAreaInsets
            
            NavigationStack {
                PullEffectScrollView(
                    actionTopPadding: safeAreaInsets.top + 35,
                    leadingAction: .init(
                        symbol: "plus",
                        action: {
                        
                    }),
                    centerAction: .init(
                        symbol: "arrow.clockwise",
                        action: {
                        
                    }),
                    trailingAction: .init(
                        symbol: "xmark",
                        action: {
                        
                    }),
                ) {
                    DummyView()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Home")
            }
        }
    }
}

#Preview {
    ContentView()
}
