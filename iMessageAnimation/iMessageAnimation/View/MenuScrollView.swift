import SwiftUI

struct MenuScrollView: View {
    @Binding var config: MenuConfig
    let proxy: GeometryProxy
    var actions: [MenuAction]
    var animateContent: Bool
    var animateLabels: Bool
    @Binding var activeActionID: String?
    var body: some View {
        ScrollView(.vertical) {
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                ForEach(actions) {
                    MenuActionView(
                        config: config,
                        action: $0,
                        animateContent: animateContent,
                        animateLabels: animateLabels
                    )
                }
            }
            .scrollTargetLayout()
            .padding(
                .horizontal,
                25
            )
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .background {
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
                    )
                    .contentShape(.rect)
                    .onTapGesture {
                        guard config.showMenu else { return }
                        config.showMenu = false
                    }
                    .visualEffect { content, proxy in
                        content
                            .offset(
                                x: -proxy.frame(in: .global).minX,
                                y: -proxy.frame(in: .global).minY
                            )
                    }
            }
        }
        .safeAreaPadding(
            .vertical,
            20
        )
        .safeAreaPadding(
            .top,
            (proxy.size.height - 70) / 2
        )
        .scrollPosition(
            id: $activeActionID,
            anchor: .top
        )
        .scrollIndicators(.hidden)
        .allowsHitTesting(config.showMenu)
    }
}
