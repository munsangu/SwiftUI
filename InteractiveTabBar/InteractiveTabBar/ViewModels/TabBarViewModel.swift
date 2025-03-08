import SwiftUI

final class TabBarViewModel: ObservableObject {
    @Published var activeTab: TabItem = .home
    @Published var activeDraggingTab: TabItem?
    @Published var tabButtonLocations: [CGRect] = Array(repeating: .zero, count: TabItem.allCases.count)
    
    func changeTab(to tab: TabItem) {
        activeTab = tab
    }

    func updateTabLocation(for tab: TabItem, location: CGRect) {
        tabButtonLocations[tab.index] = location
    }
    
    func updateDraggingTab(at location: CGPoint) {
        if let index = tabButtonLocations.firstIndex(where: { $0.contains(location) }) {
            activeDraggingTab = TabItem.allCases[index]
        }
    }
    
    func endDragging() {
        if let activeDraggingTab {
            activeTab = activeDraggingTab
        }
        
        activeDraggingTab = nil
    }
    
    func isTabActive(_ tab: TabItem) -> Bool {
        return (activeDraggingTab ?? activeTab) == tab
    }
}
