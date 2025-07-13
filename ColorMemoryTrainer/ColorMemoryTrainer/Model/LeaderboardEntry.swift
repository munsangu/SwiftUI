import Foundation
import SwiftData

@Model
class LeaderboardEntry {
    var id: UUID
    var date: Date
    var level: Int
    var score: Int

    init(
        level: Int,
        score: Int
    ) {
        self.id = UUID()
        self.date = Date()
        self.level = level
        self.score = score
    }
}
