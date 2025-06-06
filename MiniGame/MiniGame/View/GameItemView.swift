import SwiftUI

struct GameItemView: View {
    let item: GameItem

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: item.type == .A ? "textformat.size.larger" : "bold")
                .resizable()
                .scaledToFit()
                .frame(
                    width: 100,
                    height: 100
                )
        }
    }
}
