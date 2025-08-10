import SwiftUI

struct InfiniteCarouselView<Data: RandomAccessCollection, ID: Hashable, Content: View>: View {
    let data: Data
    let id: KeyPath<Data.Element, ID>
    let spacing: CGFloat
    let repeatCount: Int
    let content: (Data.Element) -> Content
    init(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        spacing: CGFloat = 10,
        repeatCount: Int = 1,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.id = id
        self.spacing = spacing
        self.repeatCount = repeatCount
        self.content = content
    }
    var body: some View {
        let repeatedData = Array(
            repeating: Array(data),
            count: repeatCount
        ).flatMap { $0 }
        
        ScrollView(
            .horizontal,
            showsIndicators: false
        ) {
            HStack(spacing: spacing) {
                ForEach(
                    repeatedData,
                    id: id
                ) { item in
                    GeometryReader { geo in
                        let midX = geo.frame(in: .global).midX
                        let screenMidX = UIScreen.main.bounds.width / 2

                        let distance = abs(midX - screenMidX)
                        let scale = max(0.7, 1 - (distance / screenMidX) * 0.3)
                        let opacity = max(0.4, 1 - (distance / screenMidX) * 0.6)
                        
                        content(item)
                            .scaleEffect(scale)
                            .opacity(opacity)
                            .animation(
                                .easeOut(duration: 0.3),
                                value: scale
                            )
                    }
                    .frame(
                        width: 300,
                        height: 300
                    )
                }
            }
            .padding(
                .horizontal,
                (UIScreen.main.bounds.width - 300) / 2
            )
        }
    }
}
