import Foundation

struct TimeModel: Equatable {
    let hour: Int
    let minute: Int
    let second: Int
    
    init(date: Date = Date()) {
        let calendar = Calendar.current
        self.hour = calendar.component(.hour, from: date)
        self.minute = calendar.component(.minute, from: date)
        self.second = calendar.component(.second, from: date)
    }
    
    var hourFirstDigit: Int {
        return hour / 10
    }
    
    var hourSecondDigit: Int {
        return hour % 10
    }
    
    var minuteFirstDigit: Int {
        return minute / 10
    }
    
    var minuteSecondDigit: Int {
        return minute % 10
    }
    
    var secondFirstDigit: Int {
        return second / 10
    }
    
    var secondSecondDigit: Int {
        return second % 10
    }
    
    static func == (
        lhs: TimeModel,
        rhs: TimeModel
    ) -> Bool {
        return lhs.hour == rhs.hour &&
               lhs.minute == rhs.minute &&
               lhs.second == rhs.second
    }
}
