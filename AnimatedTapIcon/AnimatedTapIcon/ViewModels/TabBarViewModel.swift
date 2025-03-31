import SwiftUI

class TabBarViewModel: ObservableObject {

    @Published var activeTab: Tab = .photos
    @Published var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    @Published var bounceDown: Bool = true
    
    func selectTab(_ tab: Tab) {
        guard let index = allTabs.firstIndex(where: { $0.tab == tab }) else { return }
        
        withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
            activeTab = tab
            allTabs[index].isAnimating = true
        }, completion: {
            var transaction = Transaction()
            transaction.disablesAnimations = true
            withTransaction(transaction) {
                self.allTabs[index].isAnimating = nil
            }
        })
    }
    
    func setBounceDirection(down: Bool) {
        bounceDown = down
    }
}
