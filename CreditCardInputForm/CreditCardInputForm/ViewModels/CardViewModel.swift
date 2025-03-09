import SwiftUI
import Combine

class CardViewModel: ObservableObject {
    @Published var card: Card = .init()
    @Published var activeField: ActiveField? = nil
    @Published var animateField: ActiveField? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $activeField
            .sink { [weak self] newValue in
                withAnimation(.snappy) {
                    self?.animateField = newValue
                }
            }
            .store(in: &cancellables)
    }
    
    func formatCardNumber() {
        card.number = String(
            card.number
                .group(" ", count: 4)
                .prefix(19)
        )
        if card.number.count == 19 {
            activeField = .name
        }
    }
    
    func formatMonth() {
        card.month = String(card.month.prefix(2))
        if card.month.count == 2 {
            activeField = .year
        }
    }
    
    func formatYear() {
        card.year = String(card.year.prefix(2))
        if card.year.count == 2 {
            activeField = .cvv
        }
    }
    
    func formatCVV() {
        card.cvv = String(card.cvv.prefix(3))
    }
}
