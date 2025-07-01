import Foundation

struct DrumPad: Identifiable {
    let id = UUID()
    let name: String
    let fileName: String
    let fileExtension: String
    let label: String
}
