import Foundation

struct WaterGlass: Identifiable {
    let id = UUID()
    let amount: Int
    var isDrunk: Bool
}
