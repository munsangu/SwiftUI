import SwiftUI
import Combine

class ScalingThreeDotsLoaderViewModel: ObservableObject {
    @Published var isAnimating = false
    let foregroundColor = Color(red: 0.51, green: 0.38, blue: 0.94, opacity: 0.55)
    
    func startAnimation() {
        isAnimating = true
    }
}
