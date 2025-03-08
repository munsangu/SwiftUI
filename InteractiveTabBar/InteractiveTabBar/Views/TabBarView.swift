import SwiftUI

struct TabBarView: View {
    @ObservedObject private var viewModel: TabBarViewModel
    @Namespace private var animation
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases) { tab in
                TabButtonView(
                    tab: tab,
                    viewModel: viewModel,
                    animation: animation
                )
            }
        }
        .frame(height: 40)
        .padding(5)
        .background {
            Capsule()
                .fill(.background
                    .shadow(
                        .drop(
                            color: .primary.opacity(0.2),
                            radius: 5
                        )
                    )
                )
        }
        .coordinateSpace(.named("TABBAR"))
        .padding(.horizontal, 15)
        .padding(.bottom, 10)
    }
}

#Preview {
    TabBarView(viewModel: TabBarViewModel())
        .previewLayout(.sizeThatFits)
}
