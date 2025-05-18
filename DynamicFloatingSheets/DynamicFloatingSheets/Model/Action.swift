import SwiftUI

struct Action: Identifiable, Hashable {
    var id: UUID = UUID()
    var image: String
    var title: String
}

let actions: [Action] = [
    .init(image: "xbox.logo", title: "Game Pass"),
    .init(image: "playstation.logo", title: "PS Plus"),
    .init(image: "apple.logo", title: "iCloud+"),
    .init(image: "appletv.fill", title: "Apple TV")
]


