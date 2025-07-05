import Foundation

struct KalimbaKey: Identifiable {
    let id = UUID()
    let note: String
    let soundFile: String
    let keyWidth: CGFloat
    let heightRatio: CGFloat
    let isLeftAligned: Bool
}
