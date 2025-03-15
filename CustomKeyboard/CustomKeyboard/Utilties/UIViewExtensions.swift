import UIKit

extension UIView {
    var allSubViews: [UIView] {
        return self.subviews.flatMap({ [$0] + $0.allSubViews })
    }
}
