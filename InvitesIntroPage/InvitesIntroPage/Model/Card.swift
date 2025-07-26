import Foundation

struct Card: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var image: String
}

let cards: [Card] = [
    .init(image: "Pic1"),
    .init(image: "Pic2"),
    .init(image: "Pic3"),
    .init(image: "Pic4"),
]
