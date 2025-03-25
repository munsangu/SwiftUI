import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var topMenuItems: [MenuItem] = []
    @Published var mainMenuItems: [MenuItem] = []
    
    init() {
        setupMenuItems()
    }
    
    private func setupMenuItems() {
        // Top menu items (icon only)
        topMenuItems = [
            MenuItem(title: "View", iconName: "document.viewfinder", action: .viewfinder),
            MenuItem(title: "Pin", iconName: "pin.fill", action: .pin),
            MenuItem(title: "Lock", iconName: "lock.fill", action: .lock)
        ]
        
        // Main menu items (with text and icon)
        mainMenuItems = [
            MenuItem(title: "Find in Note", iconName: "magnifyingglass", action: .find),
            MenuItem(title: "Move Note", iconName: "folder", action: .move),
            MenuItem(title: "Lines & Grids", iconName: "squareshape.split.3x3", action: .linesAndGrids),
            MenuItem(title: "Delete", iconName: "trash", action: .delete)
        ]
    }
    
    func handleAction(for item: MenuItem) {
        switch item.action {
        case .viewfinder:
            print("View action triggered")
        case .pin:
            print("Pin action triggered")
        case .lock:
            print("Lock action triggered")
        case .find:
            print("Find action triggered")
        case .move:
            print("Move action triggered")
        case .linesAndGrids:
            print("Lines & Grids action triggered")
        case .delete:
            print("Delete action triggered")
        }
    }
}
