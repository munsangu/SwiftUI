import SwiftUI

struct RootLauncherView: View {
    @AppStorage("playerNickname") private var nickname: String = ""
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if !hasSeenOnboarding {
            OnboardingView()
        } else if nickname.isEmpty {
            NicknameInputView()
        } else {
            GameRootView()
        }
    }
}
