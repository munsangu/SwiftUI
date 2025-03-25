import Foundation

struct Note: Identifiable {
    let id: UUID = UUID()
    var title: String
    var content: String
    var imageNamed: String?
    var dateCreated: Date = Date()
    var isPinned: Bool = false
    var isLocked: Bool = false
}

extension Note {
    static let sampleNote = Note(
        title: "Cafe On A Rainy Day",
        content: "Sample content about a rainy day at the cafe.",
        imageNamed: "cafe"
    )
}
