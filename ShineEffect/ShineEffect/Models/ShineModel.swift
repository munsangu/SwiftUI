import Foundation

struct ShineModel {
    var duration: CGFloat
    var rightToLeft: Bool
    
    init(
        duration: CGFloat = 0.5,
        rightToLeft: Bool = false
    ) {
        self.duration = duration
        self.rightToLeft = rightToLeft
    }
}
