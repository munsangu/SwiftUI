import SwiftUI

struct SettingsView: View {
    @AppStorage("playerNickname") private var nickname: String = "Player"

    var body: some View {
        Form {
            Section(header: Text("Player Nickname")) {
                TextField(
                    "Enter your nickname",
                    text: $nickname
                )
            }
        }
        .navigationTitle("Settings")
    }
}
