import SwiftUI

enum Tab: String, CaseIterable, Identifiable {
    case photos = "photo.stack"
    case chat = "bubble.left.and.bubble.right"
    case apps = "square.3.layers.3d"
    case notifications = "bell.and.waves.left.and.right"
    case profile = "person.2.crop.square.stack.fill"
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .photos:
            return "Photos"
        case .chat:
            return "Chats"
        case .apps:
            return "Apps"
        case .notifications:
            return "Notifications"
        case .profile:
            return "Profile"
        }
    }
}
