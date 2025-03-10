import SwiftUI
import Combine

final class FloatingButtonViewModel: ObservableObject {
    @Published var isExpanded: Bool = false
    @Published var dragLocation: CGPoint = .zero
    @Published var selectedAction: FloatingActionModel?
    var isDragging: GestureState<Bool> = GestureState(initialValue: false)
    private(set) var actions: [FloatingActionModel] = []
    let buttonSize: CGFloat
    
    init(
        buttonSize: CGFloat = 50,
        @FloatingActionBuilder actions: @escaping () -> [FloatingActionModel]
    ) {
        self.buttonSize = buttonSize
        self.actions = actions()
    }
    
    func toggleExpanded() {
        isExpanded.toggle()
    }
    
    func executeAction(_ action: FloatingActionModel) {
        action.action()
        isExpanded = false
    }
    
    func handleDragEnded() {
        Task {
            if let selectedAction {
                isExpanded = false
                selectedAction.action()
            }
            
            self.selectedAction = nil
            self.dragLocation = .zero
        }
    }
    
    func handleDragChange(location: CGPoint) {
        guard isExpanded else { return }
        dragLocation = location
    }
    
    func progress(_ action: FloatingActionModel) -> CGFloat {
        let index = CGFloat(actions.firstIndex(where: { $0.id == action.id }) ?? 0)
        return actions.count == 1 ? 1 : (index / CGFloat(actions.count - 1))
    }

    var actionOffset: CGFloat {
        let size = buttonSize + 10
        return Double(actions.count) * (actions.count == 1 ?
                                        size * 2 :
                                            (actions.count == 2 ?
                                             size * 1.25 :
                                                size
                                            )
                                        )
    }
    
    func checkAndSelectAction(actionId: UUID, containsPoint: Bool) {
        if isExpanded && isDragging.wrappedValue {
            if containsPoint {
                selectedAction = actions.first(where: { $0.id == actionId })
            } else {
                if selectedAction?.id == actionId && !containsPoint {
                    selectedAction = nil
                }
            }
        }
    }
}
