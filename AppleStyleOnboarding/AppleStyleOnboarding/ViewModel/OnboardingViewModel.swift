import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var showOnboarding: Bool = true
    let tintColor: Color = .red
    let title: String = "Welcome to Apple Games"

    var icon: some View {
        Image(systemName: "gamecontroller.fill")
            .font(.system(size: 50))
            .frame(
                width: 100,
                height: 100
            )
            .foregroundStyle(.white)
            .background(
                tintColor.gradient,
                in: .rect(cornerRadius: 25)
            )
            .frame(height: 180)
    }

    var cards: [AppleOnboardingCard] {
        [
            AppleOnboardingCard(
                symbol: "list.bullet",
                title: "See What's New, Just for you",
                subTitle: "Explore whats's happening in your games and what to play next."
            ),
            AppleOnboardingCard(
                symbol: "person.2",
                title: "Play and Compete with Friends",
                subTitle: "Challenge friends, see what they're playing, and play together."
            ),
            AppleOnboardingCard(
                symbol: "square.stack",
                title: "All Your Games in One Place",
                subTitle: "Access your full game library from the App Store and Apple Arcade."
            )
        ]
    }

    var footer: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {
            Image(systemName: "person.3.fill")
                .foregroundStyle(tintColor)
            
            Text("Your game play information, including what you play and your game activity, is used to improve Game Center.")
                .font(.caption2)
                .foregroundStyle(.gray)
        }
        .padding(
            .vertical,
            15
        )
    }

    func continueTapped() {
        showOnboarding = false
    }
}
