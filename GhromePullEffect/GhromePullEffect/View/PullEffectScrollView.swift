import SwiftUI

struct PullEffectScrollView<Content: View>: View {
    var dragDistance: CGFloat = 100
    var actionTopPadding: CGFloat = 0
    var leadingAction: PullEffectAction
    var centerAction: PullEffectAction
    var trailingAction: PullEffectAction
    @ViewBuilder var content: Content
    @State private var effectProgress: CGFloat = 0
    @GestureState private var isGestureActive: Bool = false
    @State private var scrollOffset: CGFloat = 0
    @State private var initialScrollOffset: CGFloat?
    @State private var activePosition: ACtionPosition?
    @State private var scaleEffect: Bool = false
    @State private var hapticsTrigger: Bool = false
    @Namespace private var animation
    var body: some View {
        ScrollView(.vertical) {
            content
        }
        .onScrollGeometryChange(for: CGFloat.self, of: {
            $0.contentOffset.y + $0.contentInsets.top
        }, action: { oldValue, newValue in
            scrollOffset = newValue
        })
        .onChange(
            of: isGestureActive,
            { oldValue, newValue in
                initialScrollOffset = newValue ? scrollOffset.rounded() : nil
            }
        )
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .updating(
                    $isGestureActive,
                    body: { _, out, _ in
                    out = true
                    }
                )
                .onChanged { value in
                    guard initialScrollOffset == 0 else { return }
                    let translationY = value.translation.height
                    let progress = min(max(translationY / dragDistance, 0), 1)
                    
                    effectProgress = progress
                    
                    guard translationY >= dragDistance else {
                        activePosition = nil
                        return
                    }
                    
                    let translationX = value.translation.width
                    let indexProgress = translationX / dragDistance
                    let index: Int = -indexProgress > 0.5 ? -1 : (indexProgress > 0.5 ? 1 : 0)
                    
                    let landingAction = ACtionPosition.allCases.first(where: { $0.rawValue == index })
                    
                    if activePosition != landingAction {
                        hapticsTrigger.toggle()
                    }
                    
                    activePosition = landingAction
                }
                .onEnded { value in
                    guard effectProgress != 0 else { return }
                    if let  activePosition {
                        withAnimation(
                            .easeInOut(duration: 0.25),
                            completionCriteria: .logicallyComplete
                        ) {
                            scaleEffect = true
                        } completion: {
                            scaleEffect = false
                            effectProgress = 0
                            self.activePosition = nil
                        }
                        
                        switch activePosition {
                            case .leading: leadingAction.action()
                            case .center: centerAction.action()
                            case .trailing: trailingAction.action()
                        }
                    } else {
                        withAnimation(.easeOut(duration: 0.25)) {
                            effectProgress = 0
                        }
                    }
                },
            isEnabled: !scaleEffect
        )
        .background(alignment: .top) {
            ActionView()
                .padding(
                    .top,
                    actionTopPadding
                )
                .ignoresSafeArea()
        }
        .sensoryFeedback(
            .impact,
            trigger: hapticsTrigger
        )
    }
    
    @ViewBuilder
    private func ActionView() -> some View {
        HStack(spacing: 0) {
            let delayProgress = (effectProgress - 0.7) / 0.3
            
            ActionButton(.leading)
                .offset(x: 30 * (1 - delayProgress))
                .opacity(delayProgress)
            
            ActionButton(.center)
                .blur(radius: 10 * (1 - effectProgress))
                .opacity(effectProgress)
            
            ActionButton(.trailing)
                .offset(x: -30 * (1 - delayProgress))
                .opacity(delayProgress)
        }
        .padding(
            .horizontal,
            20
        )
        .opacity(scaleEffect ? 0 : 1)
    }
    
    @ViewBuilder
    private func ActionButton(_ position: ACtionPosition) -> some View {
        let action = position == .center ? centerAction : position == .trailing ? trailingAction : leadingAction
        
        Image(systemName: action.symbol)
            .font(.title2)
            .fontWeight(.semibold)
            .opacity(scaleEffect ? 0 : 1)
            .animation(
                .linear(duration: 0.05),
                value: scaleEffect
            )
            .frame(
                width: 60,
                height: 60
            )
            .background {
                if activePosition == position {
                    ZStack {
                        Rectangle()
                            .fill(.background)
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                    }
                    .clipShape(.rect(cornerRadius: scaleEffect ? 0 : 30))
                    .compositingGroup()
                    .matchedGeometryEffect(
                        id: "INDICATOR",
                        in: animation
                    )
                    .scaleEffect(
                        scaleEffect ? 20 : 1,
                        anchor: .bottom
                    )
                }
            }
            .frame(maxWidth: .infinity)
            .compositingGroup()
            .animation(
                .easeOut(duration: 0.25),
                value: activePosition
            )
    }
    
    private enum ACtionPosition: Int, CaseIterable {
        case leading = -1
        case center = 0
        case trailing = 1
    }
}

struct PullEffectAction {
    var symbol: String
    var action: () -> ()
}
