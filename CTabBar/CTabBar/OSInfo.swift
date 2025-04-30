import SwiftUI

enum OSInfo: String, CaseIterable {
    case ios = "iOS"
    case appleWatch = "watchOS"
    case ipad = "iPadOS"
    case macbook = "macOS"
    case visionOS = "visionOS"
    
    var symbolImage: String {
        switch self {
        case .ios: "iphone"
        case .appleWatch: "applewatch"
        case .ipad: "ipad"
        case .macbook: "macbook"
        case .visionOS: "vision.pro"
        }
    }
}
