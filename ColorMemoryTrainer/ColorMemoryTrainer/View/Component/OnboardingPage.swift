import SwiftUI

struct OnboardingPage: View {
    let title: String
    let message: String

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text(title)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            Text(message)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    OnboardingPage(title: "TEST", message: "TEST")
}
