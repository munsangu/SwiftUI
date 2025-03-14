import Foundation

struct Download: Identifiable {
    var id: UUID = .init()
    var date: Date
    var value: Double
    var isAnimated: Bool = false
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
}
