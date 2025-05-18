import SwiftUI

struct KeyPad: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var value: Int
    var isBack: Bool = false
}

let keypadValues: [KeyPad] = (1...9).compactMap(
    {
    .init(
        title: String("\($0)"),
        value: $0
        )
    }
) + [
    .init(title: "0", value: 0),
    .init(title: "chevron.left", value: -1, isBack: true),
]
