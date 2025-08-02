import Foundation

struct NFCData: Identifiable, Equatable {
    let id = UUID().uuidString
    let payload: String
    let type: String
    let timestamp: Date
    
    init(
        payload: String,
        type: String = "NDEF"
    ) {
        self.payload = payload
        self.type = type
        self.timestamp = Date()
    }
}

enum NFCReadingState: Equatable {
    case idle
    case reading
    case success(NFCData)
    case error(String)
}
