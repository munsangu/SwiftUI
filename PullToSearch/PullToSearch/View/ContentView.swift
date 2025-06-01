import SwiftUI

struct ContentView: View {
    @State var offsetY: CGFloat = 0
    @FocusState var isExpanded: Bool
    var body: some View {
        ScrollView(.vertical) {
            DummyScrollContent()
                .offset(y: isExpanded ? -offsetY : 0)
                .onGeometryChange(for: CGFloat.self) {
                    $0.frame(in: .scrollView(axis: .vertical)).minY
                } action: { newValue in
                    offsetY = newValue
                }
        }
        .overlay {
            Rectangle()
                .fill(.ultraThinMaterial)
                .background(.background.opacity(0.25))
                .ignoresSafeArea()
                .overlay {
                    ExpandedSearchView(isExpanded: $isExpanded)
                        .offset(y: isExpanded ? 0 : 70)
                        .opacity(isExpanded ? 1 : 0)
                        .allowsHitTesting(isExpanded)
                }
                .opacity(isExpanded ? 1 : progress)
        }
        .safeAreaInset(edge: .top) {
            HeaderView(
                isExpanded: $isExpanded,
                progress: progress
            )
        }
        .scrollTargetBehavior(onScrollEnded { dy in
            if offsetY > 100 || (-dy > 1.5 && offsetY > 0) {
                isExpanded = true
            }
        })
        .animation(
            .interpolatingSpring(duration: 0.2),
            value: isExpanded
        )
    }
    
    var progress: CGFloat {
        return max(
            min(offsetY / 100, 1),
            0
        )
    }
}

struct onScrollEnded: ScrollTargetBehavior {
    var onEnd: (CGFloat) -> ()
    func updateTarget(
        _ target: inout ScrollTarget,
        context: TargetContext
    ) {
        let dy = context.velocity.dy
        DispatchQueue.main.async {
            onEnd(dy)
        }
    }
}

#Preview {
    ContentView()
}
