import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var angle: Double
    var distance: CGFloat
    var color: Color
}
