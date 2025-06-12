import Foundation

enum ClockHandType {
    case second
    case minute
    case hour

    var updateInterval: TimeInterval {
        switch self {
        case .second: return 0.1
        case .minute: return 6.0
        case .hour: return 36.0
        }
    }

    var length: CGFloat {
        switch self {
        case .second: return 100
        case .minute: return 90
        case .hour: return 60
        }
    }

    var lineWidth: CGFloat {
        switch self {
        case .second: return 4
        case .minute: return 6
        case .hour: return 4
        }
    }
}
