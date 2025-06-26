import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID
    var name: String
    var isCompletedToday: Bool
    
    init(
        id: UUID = UUID(),
        name: String,
        isCompletedToday: Bool = false
    ) {
        self.id = id
        self.name = name
        self.isCompletedToday = isCompletedToday
    }
}
