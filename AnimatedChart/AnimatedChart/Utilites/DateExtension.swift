import Foundation

extension Date {
    static func createDate(
        _ day: Int,
        _ month: Int,
        _ year: Int
    ) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        
        let calendar = Calendar.current
        let date = calendar.date(from: components) ?? .init()
        
        return date
    }
}
