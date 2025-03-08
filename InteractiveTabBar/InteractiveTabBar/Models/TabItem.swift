import Foundation

enum TabItem: String, CaseIterable, Identifiable {
    case home = "Home"
    case search = "Search"
    case notifications = "Notifications"
    case settings = "Settings"
    
    var symbolImage: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .notifications: return "bell"
        case .settings: return "gearshape"
        }
    }
    
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
    
    var id: String { rawValue }
}
