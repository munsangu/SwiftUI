import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID
    var name: String
    var isCompletedToday: Bool
    var notificationHour: Int?
    var notificationMinute: Int?
    
    init(
        id: UUID = UUID(),
        name: String,
        isCompletedToday: Bool = false,
        notificationHour: Int? = nil,
        notificationMinute: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.isCompletedToday = isCompletedToday
        self.notificationHour = notificationHour
        self.notificationMinute = notificationMinute
    }
}
