import Foundation

struct KalimbaKey: Identifiable {
    let id = UUID()
    let note: String
    let soundFile: String
    let keyWidth: CGFloat
    let keyHeight: CGFloat
    let isLeftAligned: Bool
}
