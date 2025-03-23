import SwiftUI

class CardsViewModel: ObservableObject {
    @Published var isRotationEnabled: Bool = true
    @Published var showsIndicator: Bool = false
    @Published var cards: [Card] = []
    
    init() {
        setupCards()
    }
    
    private func setupCards() {
        cards = [
            .init(color: .red),
            .init(color: .blue),
            .init(color: .green),
            .init(color: .yellow),
            .init(color: .pink),
            .init(color: .purple),
            .init(color: .mint)
        ]
    }
    
    func zIndex(for card: Card) -> CGFloat {
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            return CGFloat(cards.count) - CGFloat(index)
        }
        
        return .zero
    }
    
    func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }
    
    func progress(
        _ proxy: GeometryProxy,
        limit: CGFloat = 2
    ) -> CGFloat {
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let progress = (maxX / width) - 1.0
        let cappedProgress = min(progress, limit)
        return cappedProgress
    }
    
    func scale(
        _ proxy: GeometryProxy,
        scale: CGFloat = 0.1
    ) -> CGFloat {
        let progress = progress(proxy)
        
        return 1 - (progress * scale)
    }
    
    func excessMinX(
        _ proxy: GeometryProxy,
        offset: CGFloat = 10
    ) -> CGFloat {
        let progress = progress(proxy)
        
        return progress * offset
    }
    
    func rotation(
        _ proxy: GeometryProxy,
        rotation: CGFloat = 5
    ) -> Angle {
        let progress = progress(proxy)
        
        return .init(degrees: progress * rotation)
    }
}
