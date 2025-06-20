import SwiftUI

struct CardView: View {
    var card: MemorizeGame<String>.Card
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let rondedRectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                rondedRectangle
                    .foregroundStyle(.white)
                
                rondedRectangle
                    .strokeBorder(lineWidth: 2)
                
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            rondedRectangle
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
