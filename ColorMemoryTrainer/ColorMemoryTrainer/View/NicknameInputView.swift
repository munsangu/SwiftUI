import SwiftUI

struct NicknameInputView: View {
    @AppStorage("playerNickname") private var nickname: String = ""
    @State private var tempName: String = ""
    @State private var showValidation: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            Text("👋 Welcome!")
                .font(.largeTitle)
                .bold()

            Text("Please enter your nickname to begin.")
                .multilineTextAlignment(.center)

            TextField("Nickname", text: $tempName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .autocapitalization(.none)

            if showValidation {
                Text("Nickname must be at least 2 characters.")
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Button("Start") {
                if tempName.trimmingCharacters(in: .whitespaces).count >= 2 {
                    nickname = tempName
                } else {
                    showValidation = true
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
