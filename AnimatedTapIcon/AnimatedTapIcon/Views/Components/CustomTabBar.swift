import SwiftUI

struct CustomTabBar: View {
    @ObservedObject var viewModel: TabBarViewModel
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach($viewModel.allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                TabItemView(
                    tab: tab,
                    isActive: viewModel.activeTab == tab,
                    isAnimating: animatedTab.isAnimating,
                    bounceDown: viewModel.bounceDown
                )
                .contentShape(.rect)
                .onTapGesture {
                    viewModel.selectTab(tab)
                }
            }
        }
        .background(.bar)
    }
}

