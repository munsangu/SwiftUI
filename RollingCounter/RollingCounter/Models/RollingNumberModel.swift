import Foundation

struct RollingNumberModel {
    private(set) var currentValue: Int
    
    init(initialValue: Int = 0) {
        self.currentValue = initialValue
    }
    
    mutating func updateToRandomValue(in range: ClosedRange<Int>) -> Int {
        currentValue = .random(in: range)
        return currentValue
    }
    
    mutating func updateValue(to newValue: Int) -> Int {
        currentValue = newValue
        return currentValue
    }
}
