import SwiftUI

struct Card: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var subTitle: String
    var description: String
}
