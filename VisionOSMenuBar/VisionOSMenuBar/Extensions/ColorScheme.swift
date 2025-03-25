import SwiftUI

extension ColorScheme {
    var currentColor: Color {
        switch self {
        case .light:
            return .white
        case .dark:
            return .black
        default:
            return .clear
        }
    }
}
