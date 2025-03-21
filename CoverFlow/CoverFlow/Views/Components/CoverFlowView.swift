import SwiftUI

struct CoverFlowView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
    var itemWidth: CGFloat
    var enableReflection: Bool = false
    var spacing: CGFloat = 0
    var rotation: Double
    var items: Item
    var content: (Item.Element) -> Content
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items) { item in
                        content(item)
                            .frame(width: itemWidth)
                            .reflection(enableReflection)
                            .visualEffect { content, geometryProxy in
                                content
                                    .rotation3DEffect(
                                        .init(degrees: rotation(geometryProxy)),
                                        axis: (x: 0, y: 1, z: 0),
                                        anchor: .center
                                    )
                            }
                            .padding(
                                .trailing,
                                item.id == items.last?.id ?
                                    0 :
                                    spacing
                            )
                    }
                }
                .padding(
                    .horizontal,
                    (size.width - itemWidth) / 2
                )
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollClipDisabled()
        }
    }
    
    func rotation(_ proxy: GeometryProxy) -> Double {
        let scrollViewWidth = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let midX = proxy.frame(in: .scrollView(axis: .horizontal)).midX
        let progress = midX / scrollViewWidth
        let cappedProgress = max(min(progress, 1), 0)
        let cappedRotaion = max(min(rotation, 90), 0)
        let degree = cappedProgress * (rotation * 2)
        return cappedRotaion - degree
    }
}
