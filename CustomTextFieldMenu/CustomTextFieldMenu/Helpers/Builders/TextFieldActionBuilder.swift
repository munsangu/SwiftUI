import SwiftUI

@resultBuilder
struct TextFieldActionBuilder {
    static func buildBlock(_ components: TextFieldAction...) -> [TextFieldAction] {
        components.compactMap { $0 }
    }
    
    static func buildOptional(_ component: [TextFieldAction]?) -> [TextFieldAction] {
        component ?? []
    }
    
    static func buildArray(_ components: [[TextFieldAction]]) -> [TextFieldAction] {
        components.flatMap { $0 }
    }
    
    static func buildEither(first component: [TextFieldAction]) -> [TextFieldAction] {
        component
    }
    
    static func buildEither(second component: [TextFieldAction]) -> [TextFieldAction] {
        component
    }
}
