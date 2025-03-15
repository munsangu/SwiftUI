import Foundation

struct PinCodeModel {
    var pinCode: String = ""
    let maxLength: Int

    init(maxLength: Int = 6) {
        self.maxLength = maxLength
    }
    
    var isMaxLength: Bool {
        return pinCode.count >= maxLength
    }
    var isEmpty: Bool {
        return pinCode.isEmpty
    }
    
    mutating func appendDigit(_ digit: String) {
        guard !isMaxLength else { return }
        pinCode += digit
    }
    
    mutating func removeLastDigit() {
        guard !isEmpty else { return }
        pinCode.removeLast()
    }
    
    mutating func clear() {
        pinCode = ""
    }
}
