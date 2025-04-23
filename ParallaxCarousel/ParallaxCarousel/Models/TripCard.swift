import SwiftUI

struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subtitle: String
    var image: String
}

var tripCards: [TripCard] = [
    .init(
        title: "London",
        subtitle: "England",
        image: "Pic1"
    ),
    .init(
        title: "New York",
        subtitle: "USA",
        image: "Pic2"
    ),
    .init(
        title: "Prague",
        subtitle: "Czech Republic",
        image: "Pic3"
    ),
]
