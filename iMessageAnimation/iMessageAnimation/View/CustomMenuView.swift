import SwiftUI

struct CustomMenuView<Content: View>: View {
    @Binding var config: MenuConfig
    @ViewBuilder var content: Content
    @MenuActionBuilder var actions: [MenuAction]
    @State var animateContent: Bool = false
    @State var animateLabels: Bool = false
    @State private var activeActionID: String? = nil
    var body: some View {
        content
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .overlay {
                Rectangle()
                    .fill(.bar)
                    .ignoresSafeArea()
                    .opacity(animateContent ? 1 : 0)
                    .allowsHitTesting(false)
            }
            .overlay {
                if animateContent {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .contentShape(.rect)
                        .onDisappear {
                            config.hideSourceView = false
                            activeActionID = actions.first?.id
                        }
                }
            }
            .overlay {
                GeometryReader {
                    MenuScrollView(
                        config: $config,
                        proxy: $0,
                        actions: actions,
                        animateContent: animateContent,
                        animateLabels: animateLabels,
                        activeActionID: $activeActionID
                    )
                    
                    if config.hideSourceView {
                        config.sourceView
                            .scaleEffect(
                                animateContent ? 15 : 1,
                                anchor: .bottom
                            )
                            .offset(
                                x: config.sourceLocation.minX,
                                y: config.sourceLocation.minY
                            )
                            .opacity(animateContent ? 0.25 : 1)
                            .blur(radius: animateContent ? 130 : 0)
                            .ignoresSafeArea()
                            .allowsHitTesting(false)
                    }
                }
                .opacity(config.hideSourceView ? 1 : 0)
            }
            .onChange(of: config.showMenu) { oldValue, newValue in
                if newValue {
                    config.hideSourceView = true
                }
                
                withAnimation(
                    .smooth(
                        duration: 0.45,
                        extraBounce: 0
                    )
                ) {
                    animateContent = newValue
                }
                
                withAnimation(
                    .easeInOut(duration: newValue ? 0.35 : 0.15)
                ) {
                    animateLabels = newValue
                }
            }
    }
}
