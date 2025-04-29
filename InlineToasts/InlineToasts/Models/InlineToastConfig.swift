import SwiftUI

struct InlineToastConfig {
    var icon: String
    var title: String
    var subTitle: String
    var tint: Color
    var anchor: InlineToastAnchor = .top
    var animationAnchor: InlineToastAnchor = .top
    var actionIcon: String
    var actionHandler: () -> () = { }
    
    enum InlineToastAnchor {
        case top
        case bottom
    }
}
