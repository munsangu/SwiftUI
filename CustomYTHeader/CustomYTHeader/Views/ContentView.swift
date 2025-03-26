import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let headerHeight: CGFloat = 57 + safeArea.top
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 15) {
                    ForEach(viewModel.videos) { video in
                        VideoCardView(video: video)
                    }
                }
                .padding(15)
            }
            .safeAreaInset(
                edge: .top,
                spacing: 0
            ) {
                HeaderView()
                    .padding(.bottom, 15)
                    .frame(height: headerHeight, alignment: .bottom)
                    .background(.background)
                    .offset(y: -viewModel.headerOffset)
            }
            .onScrollGeometryChange(for: CGFloat.self) { proxy in
                let maxHeight = max(0, proxy.contentSize.height - proxy.containerSize.height)
                
                let currentOffset = min(max(0, proxy.contentOffset.y), maxHeight)
                return currentOffset
            } action: { oldValue, newValue in
                viewModel.updateHeaderPosition(
                    newScrollOffset: newValue,
                    headerHeight: headerHeight)
                
            }
            .onScrollPhaseChange({ oldPhase, newPhase in
                viewModel.handleScrollPhaseChange(
                    isScrolling: newPhase.isScrolling,
                    headerHeight: headerHeight
                )
            })
            .ignoresSafeArea(.container, edges: .top)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
