import SwiftUI

struct LoginView: View {
    var onAppleLogin: () -> Void = {}
    var onPhoneLogin: () -> Void = {}
    var onEmailSignup: () -> Void = {}
    var onLogin: () -> Void = {}
    
    var body: some View {
        VStack(spacing: 12) {
            Button {
                onAppleLogin()
            } label: {
                Label(
                    "Continue With Apple",
                    systemImage: "applelogo"
                )
                    .foregroundStyle(.black)
                    .fillButton(.white)
            }
            
            Button {
                onPhoneLogin()
            } label: {
                Label(
                    "Continue With Phone",
                    systemImage: "phone.fill"
                )
                    .foregroundStyle(.white)
                    .fillButton(.button)
            }
            
            Button {
                onEmailSignup()
            } label: {
                Label(
                    "Sign Up With Email",
                    systemImage: "envelope.fill"
                )
                    .foregroundStyle(.white)
                    .fillButton(.button)
            }
            
            Button {
                onLogin()
            } label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .fillButton(.black)
                    .shadow(
                        color: .white,
                        radius: 1
                    )
            }
        }
        .padding(15)
    }
}

#Preview {
    LoginView()
        .background(.black)
}
