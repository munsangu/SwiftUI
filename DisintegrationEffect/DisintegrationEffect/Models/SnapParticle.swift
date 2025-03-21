import SwiftUI

struct SnapParticle: Identifiable {
    var id: String = UUID().uuidString
    var particleImage: UIImage
    var particleOffset: CGSize
    var initialRandomOffset: CGSize? = nil
}
