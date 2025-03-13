import SwiftUI

struct CoverFlowItem: Identifiable {
    var id: UUID = .init()
    var color: Color
    
    static var samples: [CoverFlowItem] {
        [.red, .blue, .green, .yellow, .primary].compactMap {
            return .init(color: $0)
        }
    }
}
