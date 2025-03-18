import SwiftUI

struct Toast: Identifiable {
    private(set) var id: String = UUID().uuidString
    var content: AnyView
    var offsetX: CGFloat = 0
    var isDeleting: Bool = false
    
    init(@ViewBuilder content: @escaping (String) -> some View) {
        self.content = .init(content(id))
    }
}
