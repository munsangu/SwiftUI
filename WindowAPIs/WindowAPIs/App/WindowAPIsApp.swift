import SwiftUI

@main
struct WindowAPIsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "FloatingWindow") {
            FloatingWindow()
                // .allowsHitTesting(false)
                .simultaneousGesture(WindowDragGesture())
                .toolbarVisibility(
                    .hidden,
                    for: .windowToolbar
                )
                .containerBackground(
                    .clear,
                    for: .window
                )
        }
        .windowLevel(.floating)
        // .windowBackgroundDragBehavior(.enabled)
        .windowResizability(.contentSize)
        .windowStyle(.plain)
        
        WindowGroup(id: "AlertWindow") {
            AlertWindow()
                .allowsHitTesting(false)
                .toolbarVisibility(
                    .hidden,
                    for: .windowToolbar
                )
                .containerBackground(
                    .clear,
                    for: .window
                )
        }
        .windowLevel(.floating)
        .windowBackgroundDragBehavior(.disabled)
        .windowResizability(.contentSize)
        .windowStyle(.plain)
        .restorationBehavior(.disabled)
        .defaultWindowPlacement { content, context in
            let viewSize = content.sizeThatFits(.init(context.defaultDisplay.visibleRect.size))
            return .init(.init(x: 0.5, y: 0.9), size: viewSize)
        }
    }
}
