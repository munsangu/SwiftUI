import Foundation

struct InfoItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let isCommon: Bool
}
