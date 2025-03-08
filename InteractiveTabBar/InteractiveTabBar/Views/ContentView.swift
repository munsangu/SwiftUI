import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabViewContent()
            
            TabBarView(viewModel: viewModel)
        }
    }
    
    @ViewBuilder
    private func TabViewContent() -> some View {
        if #available(iOS 18, *) {
            ModernTabView()
        } else {
            LegacyTabView()
        }
    }
    
    @available(iOS 18, *)
    private func ModernTabView() -> some View {
        TabView(selection: $viewModel.activeTab) {
            ForEach(TabItem.allCases) { tab in
                Tab.init(value: tab) {
                    TabContentView(tab: tab)
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
            }
        }
    }
    
    private func LegacyTabView() -> some View {
        TabView(selection: $viewModel.activeTab) {
            ForEach(TabItem.allCases) { tab in
                TabContentView(tab: tab)
                    .tag(tab)
                    .toolbar(.hidden, for: .tabBar)
            }
        }
    }
}

struct TabContentView: View {
    let tab: TabItem
    
    var body: some View {
        VStack {
            Image(systemName: tab.symbolImage)
                .font(.largeTitle)
            
            Text(tab.rawValue)
                .font(.headline)
                .padding(.top)
            
            Text("ここに [\(tab.rawValue)] 画面のコンテンツが表示されます")
                .padding()
                .font(.system(.footnote, weight: .black))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
