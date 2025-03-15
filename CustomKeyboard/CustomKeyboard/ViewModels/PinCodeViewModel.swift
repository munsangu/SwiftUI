import Foundation
import Combine
import SwiftUI

class PinCodeViewModel: ObservableObject {
    @Published private var model: PinCodeModel
    @Published var pinCode: String = ""
    @Published var isKeyboardActive: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    init(maxLength: Int = 6) {
        self.model = PinCodeModel(maxLength: maxLength)
        
        $pinCode
            .sink { [weak self] newValue in
                guard let self = self else { return }
                self.model.pinCode = newValue
            }
            .store(in: &cancellables)
    }
    
    func appendDigit(_ digit: String) {
        model.appendDigit(digit)
        pinCode = model.pinCode
    }
    
    func removeLastDigit() {
        model.removeLastDigit()
        pinCode = model.pinCode
    }
    
    func confirmPinCode() {}
    
    func clearPinCode() {
        model.clear()
        pinCode = model.pinCode
    }
    
    var isPinCodeEmpty: Bool {
        return model.isEmpty
    }
    
    var isPinCodeMaxLength: Bool {
        return model.isMaxLength
    }
}
