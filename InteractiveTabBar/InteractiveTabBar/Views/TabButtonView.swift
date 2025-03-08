import SwiftUI

struct TabButtonView: View {
    private let tab: TabItem
    @ObservedObject private var viewModel: TabBarViewModel
    private let animation: Namespace.ID
    
    init(tab: TabItem, viewModel: TabBarViewModel, animation: Namespace.ID) {
        self.tab = tab
        self.viewModel = viewModel
        self.animation = animation
    }
    
    var body: some View {
        let isActive = viewModel.isTabActive(tab)
        
        VStack(spacing: 6) {
            Image(systemName: tab.symbolImage)
                .symbolVariant(.fill)
                .foregroundStyle(isActive ? .white : .primary)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background {
            if isActive {
                Capsule()
                    .fill(.blue.gradient)
                    .matchedGeometryEffect(
                        id: "ACTIVETAB",
                        in: animation
                    )
            }
        }
        .contentShape(.rect)
        .padding(isActive ? 0 : 20)
        .onGeometryChange(for: CGRect.self, of: {
            $0.frame(in: .named("TABBAR"))
        }, action: { newValue in
            viewModel.updateTabLocation(for: tab, location: newValue)
        })
        .onTapGesture {
            withAnimation(.snappy) {
                viewModel.changeTab(to: tab)
            }
        }
        .gesture(
            DragGesture(coordinateSpace: .named("TABBAR"))
                .onChanged { value in
                    let location = value.location
                    withAnimation(
                        .snappy(
                            duration: 0.25,
                            extraBounce: 0
                        )) {
                            viewModel.updateDraggingTab(at: location)
                    }
                }
                .onEnded { _ in
                    viewModel.endDragging()
                },
            isEnabled: viewModel.activeTab == tab
        )
    }
}

#Preview {
    @Namespace var animation
    
    return HStack {
        TabButtonView(
            tab: .home,
            viewModel: TabBarViewModel(),
            animation: animation
        )
    }
    .frame(height: 50)
    .previewLayout(.sizeThatFits)
}
