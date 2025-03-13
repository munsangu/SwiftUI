import SwiftUI

class CoverFlowViewModel: ObservableObject {
    @Published var items: [CoverFlowItem]
    @Published var spacing: CGFloat
    @Published var rotation: CGFloat
    @Published var enableReflection: Bool
    @Published var itemWidth: CGFloat
    
    init(
        items: [CoverFlowItem] = CoverFlowItem.samples,
        spacing: CGFloat = 0,
        rotation: CGFloat = .zero,
        enableReflection: Bool = false,
        itemWidth: CGFloat = 200
    ) {
        self.items = items
        self.spacing = spacing
        self.rotation = rotation
        self.enableReflection = enableReflection
        self.itemWidth = itemWidth
    }
    
    func toggleReflection() {
        enableReflection.toggle()
    }
    
    func updateSpacing(_ value: CGFloat) {
        spacing = value
    }
    
    func updateRotation(_ value: CGFloat) {
        rotation = value
    }
}
