import SwiftUI

struct ResizableHeaderScrollView<
    Header: View,
    Content: View
>: View {
    var minimumHeight: CGFloat
    var maximumHeight: CGFloat
    var ignoreSafeAreaTop: Bool = false
    var isSticky: Bool
    @ViewBuilder var header: (CGFloat, EdgeInsets) -> Header
    @ViewBuilder var content: Content
    @State private var offsetY: CGFloat = 0
    var body: some View {
        GeometryReader {
            let safeArea = ignoreSafeAreaTop ? $0.safeAreaInsets : .init()
            
            ScrollView(.vertical) {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        content
                    } header: {
                        GeometryReader { _ in
                            let progress: CGFloat = min(max(offsetY / (maximumHeight - minimumHeight), 0), 1)
                            let resizedHeight = (maximumHeight + safeArea.top) - (maximumHeight - minimumHeight) * progress
                            
                            header(progress, safeArea)
                                .frame(
                                    height: resizedHeight,
                                    alignment: .bottom
                                )
                                .offset(y: isSticky ? (offsetY < 0 ? -offsetY : 0) : 0)
                        }
                        .frame(height: maximumHeight + safeArea.top)
                    }
                }
            }
            .ignoresSafeArea(
                .container,
                edges: ignoreSafeAreaTop ? [.top] : []
            )
            .onScrollGeometryChange(for: CGFloat.self) {
                $0.contentOffset.y + $0.contentInsets.top
            } action: { oldValue, newValue in
                offsetY = newValue
            }

        }
    }
}
