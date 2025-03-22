import Foundation

extension Date {
    var hour: Int {
        return Calendar.current.component(
            .hour,
            from: self
        )
    }
    
    var minute: Int {
        return Calendar.current.component(
            .minute,
            from: self
        )
    }
    
    var second: Int {
        return Calendar.current.component(
            .second,
            from: self
        )
    }
    
    var hourFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter.string(from: self)
    }
    
    var minuteFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        return formatter.string(from: self)
    }
    
    var secondFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ss"
        return formatter.string(from: self)
    }
}
