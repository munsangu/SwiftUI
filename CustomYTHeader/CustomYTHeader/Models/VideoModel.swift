import Foundation

struct Video: Identifiable {
    let id: String
    let title: String
    let channelName: String
    let viewCount: String
    let uploadedTime: String
    let thumbnailURL: String
    let channelAvatarURL: String
    
    init(id: String = UUID().uuidString,
         title: String = "Title",
         channelName: String = "Channel",
         viewCount: String = "View count 1.2M",
         uploadedTime: String = "2 Days ago",
         thumbnailURL: String = "",
         channelAvatarURL: String = "") {
        self.id = id
        self.title = title
        self.channelName = channelName
        self.viewCount = viewCount
        self.uploadedTime = uploadedTime
        self.thumbnailURL = thumbnailURL
        self.channelAvatarURL = channelAvatarURL
    }
    
    static func mockVideos() -> [Video] {
        return (1...20).map { _ in Video() }
    }
}
