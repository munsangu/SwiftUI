import SwiftUI
import Combine

final class CardListViewModel: ObservableObject {
    @Published private(set) var cards: [Card] = []
    @Published private(set) var totalAmount: String = "$999.99"
    @Published private(set) var selectedCardIndex: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init(cards: [Card]? = nil) {
        self.cards = cards ?? CardListViewModel.createMockCards()
        setupBindings()
    }
    
    private static func createMockCards() -> [Card] {
        return [
            .init(number: "1234", color: .red),
            .init(number: "5678", color: .orange),
            .init(number: "1256", color: .yellow),
            .init(number: "2345", color: .green),
            .init(number: "5675", color: .blue),
            .init(number: "8673", color: .teal),
            .init(number: "8673", color: .purple)
        ]
    }
    
    private func setupBindings() {
        $selectedCardIndex
            .sink { [weak self] index in
                guard let self = self,
                      index >= 0,
                      index < self.cards.count else { return }
            }
            .store(in: &cancellables)
    }
    
    func updateSelectedCard(index: Int) {
        guard index >= 0, index < cards.count else { return }
        selectedCardIndex = index
    }
    
    func getSelectedCard() -> Card? {
        guard selectedCardIndex >= 0, selectedCardIndex < cards.count else { return nil }
        return cards[selectedCardIndex]
    }
    
    func calculateCardRotation(for proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let height = proxy.size.height
        
        let progress = minY / height
        let angleForEachCard: CGFloat = -50
        let cappedProgress = progress < 0 ?
                min(max(progress, -3) , 0) :
                max(min(progress, 3), 0)
        
        return cappedProgress * angleForEachCard
    }
    
    func calculateCardVerticalOffset(for proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        return -minY
    }
}
