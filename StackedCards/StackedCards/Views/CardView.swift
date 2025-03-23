import SwiftUI

struct CardView: View {
    private let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(card.color.gradient)
    }
}

#Preview {
    CardView(Card(color: .blue))
        .frame(
            width: 200,
            height: 300
        )
}
