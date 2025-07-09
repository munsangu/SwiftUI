import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Apple Games")
        }
        .sheet(isPresented: $viewModel.showOnboarding) {
            AppleOnBoardingView(
                tint: viewModel.tintColor,
                title: viewModel.title,
                icon: { viewModel.icon },
                cards: { viewModel.cards },
                footer: { viewModel.footer },
                onContinue: viewModel.continueTapped
            )
        }
    }
}

#Preview {
    ContentView()
}
