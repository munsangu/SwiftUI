import SwiftUI

class FloatingTabViewHelper: ObservableObject {
    @Published var hideTabBar: Bool = false
}

struct HideFloatingTabBarModifier: ViewModifier {
    var status: Bool
    @EnvironmentObject private var helper: FloatingTabViewHelper
    
    func body(content: Content) -> some View {
        content
            .onChange(
                of: status,
                initial: true
            ) { oldValue, newValue in
                helper.hideTabBar = newValue
            }
    }
}
