import Foundation

struct TimeModel {
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    init(
        hours: Int = 0,
        minutes: Int = 0,
        seconds: Int = 0
    ) {
        self.hours = max(0, min(hours, 24))
        self.minutes = max(0, min(minutes, 59))
        self.seconds = max(0, min(seconds, 59))
    }
    
    var formattedTime: String {
        String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    var totalSeconds: Int {
        (hours * 3600) + (minutes * 60) + seconds
    }
}
