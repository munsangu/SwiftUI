import SwiftUI

struct FloatingTabBar<Value: CaseIterable & Hashable  & FloatingTabProtocol>: View where Value.AllCases: RandomAccessCollection {
    var config: FloatingTabConfig
    @Binding var activeTab: Value
    @Namespace private var animation
    @State private var toggleSymbolEffect: [Bool] = Array(repeating: false, count: Value.allCases.count)
    var body: some View {
        HStack(spacing: 0) {
            ForEach(
                Value.allCases,
                id: \.hashValue
            ) { tab in
                let isActive = activeTab == tab
                let index = (Value.allCases.firstIndex(of: tab) as? Int) ?? 0
                
                Image(systemName: tab.symbolImage)
                    .font(.title3)
                    .foregroundStyle(isActive ? config.activeTint : config.inactiveTint)
                    .symbolEffect(
                        .bounce.byLayer.down,
                        value: toggleSymbolEffect[index]
                    )
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .contentShape(.rect)
                    .background {
                        if isActive {
                            Capsule(style: .continuous)
                                .fill(config.activeBackgroundTint.gradient)
                                .matchedGeometryEffect(
                                    id: "ACTIVETAB",
                                    in: animation
                                )
                        }
                    }
                    .onTapGesture {
                        activeTab = tab
                        toggleSymbolEffect[index].toggle()
                    }
                    .padding(
                        .vertical,
                        config.insetAmount
                    )
            }
        }
        .padding(
            .horizontal,
            config.insetAmount
        )
        .frame(height: 50)
        .background {
            ZStack {
                if config.isTranslucent {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                } else {
                    Rectangle()
                        .fill(.background)
                }
                
                Rectangle()
                    .fill(config.backgroundColor)
            }
        }
        .clipShape(.capsule(style: .continuous))
        .animation(
            config.tabAnimation,
            value: activeTab
        )
    }
}

