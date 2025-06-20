import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(
        numberOfPairsOfCards: Int,
        cardContentFactory: (Int) -> CardContent
    ) {
        cards = []
        // Add numberOfPairsOfCards X 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(
                Card(
                    id: "\(pairIndex + 1)a",
                    content: content
                )
            )
            cards.append(
                Card(
                    id: "\(pairIndex + 1)b",
                    content: content
                )
            )
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id) : \(content) \(isFaceUp ? "Up" : "Down") \(isMatched ? "Mathched" : "")"
        }
        
        var id: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
