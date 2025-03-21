import SwiftUI

class DisintegrationViewModel: ObservableObject {
    @Published var snapEffect: Bool = false
    @Published var isRemoved: Bool = false
    @Published var reintegrateEffect: Bool = false
    @Published var isProcessing: Bool = false
    
    func startDisintegration() {
        isProcessing = true
        snapEffect = true
    }
    
    func startReintegration() {
        isProcessing = true
        reintegrateEffect = true
    }
    
    func handleEffectCompletion() {
        if snapEffect {
            withAnimation(.snappy) {
                isRemoved = true
                snapEffect = false
                isProcessing = false
            }
        } else if reintegrateEffect {
            withAnimation(.snappy) {
                isRemoved = false
                reintegrateEffect = false
                isProcessing = false
            }
        }
    }
}
