import SwiftUI

class MemorizeGameViewModel: ObservableObject {
    private static let emojis = ["👻", "🎃", "😈", "🕷️", "💀", "🕸️", "🧙‍♀️", "🙀", "🦁", "😱", "☠️", "🍭"]
   
    static func createMemorizeGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemorizeGame()
    
    var cards: [MemorizeGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card: card)
    }
}
