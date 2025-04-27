import SwiftUI

class SnapshotViewModel: ObservableObject {
    @Published var snapshot: UIImage?
    @Published var showSnapshotOverlay: Bool = false
    @Published var triggerSnapshot: Bool = false
    
    func takeSnapshot() {
        triggerSnapshot.toggle()
    }
    
    func setSnapshot(_ image: UIImage) {
        snapshot = image
        showSnapshotOverlay = true
    }
    
    func closeSnapshotOverlay() {
        snapshot = nil
        showSnapshotOverlay = false
    }
}
