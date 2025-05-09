import SwiftUI

protocol FloatingTabProtocol {
    var symbolImage: String { get }
}

enum AppTab: String, CaseIterable, FloatingTabProtocol {
    case memories = "memories"
    case library = "Library"
    case albums = "Albums"
    case search = "Search"
    
    var symbolImage: String {
        switch self {
        case .memories: "memories"
        case .library: "photo.fill.on.rectangle.fill"
        case .albums: "square.stack.fill"
        case .search: "magnifyingglass"
        }
    }
}
