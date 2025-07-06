import SwiftUI

enum GameColor: CaseIterable {
    case red, green, blue, yellow, orange, purple

    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .orange:
            return .orange
        case .purple:
            return .purple
        }
    }
}
