import SwiftUI

struct ColorButtonsGrid: View {
    let viewModel: GameViewModel
    var body: some View {
        LazyVGrid(
            columns: Array(
                repeating: .init(),
                count: 3
            )
        ) {
            ForEach(
                GameColor.allCases,
                id: \.self
            ) { gameColor in
                Button {
                    viewModel.selectColor(gameColor)
                } label: {
                    Circle()
                        .fill(gameColor.color)
                        .frame(
                            width: 60,
                            height: 60
                        )
                }
            }
        }
    }
}

#Preview {
    ColorButtonsGrid(viewModel: GameViewModel())
}
