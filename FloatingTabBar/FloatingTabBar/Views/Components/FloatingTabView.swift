import SwiftUI



struct FloatingTabView<
    Content: View,
    Value: CaseIterable & Hashable & FloatingTabProtocol
>: View where Value.AllCases: RandomAccessCollection {
    var config: FloatingTabConfig
    @Binding var selection: Value
    var content: (Value, CGFloat) -> Content
    
    init(
        config: FloatingTabConfig = .init(),
        selection: Binding<Value>,
        @ViewBuilder content: @escaping (Value, CGFloat) -> Content
    ) {
        self.config = config
        self._selection = selection
        self.content = content
    }
    
    @State private var tabBarSize: CGSize = .zero
    @StateObject private var helper: FloatingTabViewHelper = .init()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if #available(iOS 18, *) {
                TabView(selection: $selection) {
                    ForEach(
                        Value.allCases,
                        id: \.hashValue
                    ) { tab in
                        Tab.init(value: tab) {
                            content(tab, tabBarSize.height)
                                .toolbarVisibility(
                                    .hidden,
                                    for: .tabBar
                                )
                        }
                    }
                }
            } else {
                TabView(selection: $selection) {
                    ForEach(
                        Value.allCases,
                        id: \.hashValue
                    ) { tab in
                        content(tab, tabBarSize.height)
                            .tag(tab)
                            .toolbar(
                                .hidden,
                                for: .tabBar
                            )
                    }
                }
            }
            
            FloatingTabBar(
                config: config,
                activeTab: $selection
            )
            .padding(
                .horizontal,
                config.hPadding
            )
            .padding(
                .bottom,
                config.bPadding
            )
            .onGeometryChange(for: CGSize.self) {
                $0.size
            } action: { newValue in
                tabBarSize = newValue
            }
            .offset(y: helper.hideTabBar ? (tabBarSize.height + 100) : 0)
            .animation(
                config.tabAnimation,
                value: helper.hideTabBar
            )

        }
        .environmentObject(helper)
    }
}

