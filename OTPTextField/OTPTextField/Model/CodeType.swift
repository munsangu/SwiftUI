import Foundation

enum CodeType: Int, CaseIterable, Hashable {
    case four = 4
    case six = 6
    
    var stringValue: String {
        "\(rawValue) Digit"
    }
}
