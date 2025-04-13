import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CardViewModel()

    var body: some View {
        VStack {
            SomeCardView(card: viewModel.card)
                .onTapGesture {
                    viewModel.toggleCard()
                }

            Spacer(minLength: 0)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
}
