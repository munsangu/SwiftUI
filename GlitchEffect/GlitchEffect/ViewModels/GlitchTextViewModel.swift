import Foundation
import SwiftUI

class GlitchTextViewModel: ObservableObject {
    @Published var triggers: [Bool] = [false, false, false]
    
    func triggerGlitchSequence() {
        Task {
            for i in triggers.indices {
                await MainActor.run {
                    triggers[i].toggle()
                }
                try? await Task.sleep(for: .seconds(0.6))
            }
        }
    }
}
