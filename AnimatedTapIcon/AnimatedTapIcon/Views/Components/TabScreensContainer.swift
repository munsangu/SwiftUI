import SwiftUI

struct TabScreensContainer: View {
    @ObservedObject var viewModel: TabBarViewModel
    
    var body: some View {
        TabView(selection: $viewModel.activeTab) {
            ForEach(Tab.allCases) { tab in
                TabScreenView(tab: tab)
                    .setUpTab(tab)
            }
        }
    }
}
