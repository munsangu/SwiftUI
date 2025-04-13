import SwiftUI

class CardViewModel: ObservableObject {
    @Published var card: Card? = nil

    func toggleCard() {
        withAnimation(.smooth) {
            if card == nil {
                card = Card(
                    image: "WWDC 25",
                    title: "World Wide Developer Conference 2025",
                    subTitle: "From June 9th 2025",
                    description: "Be there for the reveal of the latest Apple tools, frameworks, and features. Learn to elevate your apps and games through video sessions hosted by Apple engineers and designers."
                )
            } else {
                card = nil
            }
        }
    }
}
