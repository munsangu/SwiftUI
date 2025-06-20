import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var viewModel: MemorizeGameViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                Cards
                    .animation(
                        .default,
                        value: viewModel.cards
                    )
            }
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var Cards: some View {
        LazyVGrid(
            columns: [
                GridItem(
                    .adaptive(minimum: 85),
                    spacing: 0
                )
            ],
            spacing: 0
        ) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(
                        2/3,
                        contentMode: .fit
                    )
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundStyle(.orange)
    }
}

#Preview {
    MemorizeGameView(viewModel: MemorizeGameViewModel())
}
