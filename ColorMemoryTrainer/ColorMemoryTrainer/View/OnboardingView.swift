import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        TabView {
            OnboardingPage(
                title: "🎨 Welcome to Color Memory Trainer!",
                message: "Train your brain by remembering color sequences!"
            )
            OnboardingPage(
                title: "👀 Watch Carefully",
                message: "A sequence of colored circles will appear. Memorize the order!"
            )
            OnboardingPage(
                title: "🧠 Repeat the Sequence",
                message: "Tap the colors in the same order. Get it all right to level up!"
            )
            VStack {
                OnboardingPage(
                    title: "🏁 Ready to Play?",
                    message: "Let’s set your nickname and get started!"
                )
                Button("Start") {
                    hasSeenOnboarding = true
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 16)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
