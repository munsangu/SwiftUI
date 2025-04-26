import SwiftUI

class ShineViewModel: ObservableObject {
    @Published var isShining: Bool = false
    @Published var shineModel: ShineModel
    
    init(shineModel: ShineModel = ShineModel()) {
        self.shineModel = shineModel
    }
    
    func toggleShine() {
        isShining.toggle()
    }
    
    func updateSettings(
        duration: CGFloat? = nil,
        rightToLeft: Bool? = nil
    ) {
        if let duration = duration {
            shineModel.duration = max(0.3, duration)
        }
        
        if let rightToLeft = rightToLeft {
            shineModel.rightToLeft = rightToLeft
        }
    }
}
