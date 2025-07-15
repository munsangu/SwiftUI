import SwiftUI

struct RootLauncherView: View {
    @AppStorage("playerNickname") private var nickname: String = ""

    var body: some View {
        if nickname.isEmpty {
            NicknameInputView()
        } else {
            GameRootView()
        }
    }
}
