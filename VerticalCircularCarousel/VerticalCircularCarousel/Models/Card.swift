import SwiftUI

struct Card: Identifiable, Equatable {
    let id: UUID
    let number: String
    let name: String
    let date: String
    let color: Color
    
    init(
        id: UUID = UUID(),
        number: String,
        name: String = "Hiro",
        date: String = "12/24",
        color: Color
    ) {
        self.id = id
        self.number = number
        self.name = name
        self.date = date
        self.color = color
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
}
