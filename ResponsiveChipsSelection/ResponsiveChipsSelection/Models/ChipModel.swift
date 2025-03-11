import Foundation

struct ChipModel: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String
    var isSelected: Bool = false
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ChipModel, rhs: ChipModel) -> Bool {
        return lhs.id == rhs.id
    }
}
