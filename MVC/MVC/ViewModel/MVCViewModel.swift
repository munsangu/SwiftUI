import SwiftUI

class MVCViewModel: ObservableObject {
    @Published var selectedComponent: MVCType? = nil
    @Published var showDataFlow: Bool = false
    
    func select(_ component: MVCType) {
        withAnimation {
            selectedComponent = component
            showDataFlow = true
        }
    }
    
    func resetSelection() {
        withAnimation {
            selectedComponent = nil
            showDataFlow = false
        }
    }
}
