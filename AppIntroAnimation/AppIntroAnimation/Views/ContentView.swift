import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = IntroViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let safeArea = geometry.safeAreaInsets
            
            VStack(spacing: 0) {
                IntroView(viewModel: viewModel, size: size)
                
                LoginView(
                    onAppleLogin: handleAppleLogin,
                    onPhoneLogin: handlePhoneLogin,
                    onEmailSignup: handleEmailSignup,
                    onLogin: handleLogin
                )
                .padding(
                    .bottom,
                    safeArea.bottom
                )
                .padding(
                    .top,
                    10
                )
                .background(
                    .black,
                    in: .rect(
                        topLeadingRadius: 25,
                        topTrailingRadius: 25
                    )
                )
                .shadow(
                    color: .black.opacity(0.1),
                    radius: 5,
                    x: 0,
                    y: 0
                )
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        .task {
            viewModel.startAnimation()
        }
        .onDisappear {
            viewModel.stopAnimation()
        }
    }
    
    private func handleAppleLogin() {
        print("Apple login tapped")
    }
    
    private func handlePhoneLogin() {
        print("Phone login tapped")
    }
    
    private func handleEmailSignup() {
        print("Email signup tapped")
    }
    
    private func handleLogin() {
        print("Login tapped")
    }
}

#Preview {
    ContentView()
}
