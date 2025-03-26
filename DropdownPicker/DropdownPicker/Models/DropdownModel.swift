import SwiftUI

struct DropdownConfig {
    var activeText: String
    var show: Bool = false
    var showContent: Bool = false
    var anchor: CGRect = .zero
    var cornerRadius: CGFloat = 10
}

struct DropdownItem: Identifiable, Hashable {
    let id = UUID()
    let text: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
