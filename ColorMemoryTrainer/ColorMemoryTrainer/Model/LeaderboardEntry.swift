import Foundation
import SwiftData

@Model
class LeaderboardEntry {
    var id: UUID
    var date: Date
    var level: Int
    var score: Int
    var nickname: String

    init(
        level: Int,
        score: Int,
        nickname: String
    ) {
        self.id = UUID()
        self.date = Date()
        self.level = level
        self.score = score
        self.nickname = nickname
    }
}
