import SwiftUI

final class SlideToConfirmViewModel: ObservableObject {
    @Published var offsetX: CGFloat = 0
    @Published var isCompleted: Bool = false
    @Published var animateText: Bool = false
    
    var config: SlideToConfirm.Config
    var onSwiped: () -> ()
    
    init(
        config: SlideToConfirm.Config,
        onSwiped: @escaping () -> ()
    ) {
        self.config = config
        self.onSwiped = onSwiped
    }
    
    func handleDragChange(
        _ value: DragGesture.Value,
        maxLimit: CGFloat
    ) {
        offsetX = min(max(value.translation.width, 0), maxLimit)
    }
    
    func handleDragEnd(_ maxLimit: CGFloat) {
        if offsetX == maxLimit {
            onSwiped()
            animateText = false
            withAnimation(.smooth) {
                isCompleted = true
            }
        } else {
            withAnimation(.smooth) {
                offsetX = 0
            }
        }
    }
}
