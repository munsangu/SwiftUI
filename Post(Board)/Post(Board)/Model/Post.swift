import Foundation
import SwiftData

@Model
class Post {
    @Attribute(.unique) var id: UUID
    var title: String
    var content: String
    var createdAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        content: String,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }
}
