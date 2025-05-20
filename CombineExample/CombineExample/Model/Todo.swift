import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    let title: String
    var isDone: Bool
}
