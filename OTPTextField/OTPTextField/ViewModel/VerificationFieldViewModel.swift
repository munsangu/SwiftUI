import SwiftUI

class VerificationFieldViewModel: ObservableObject {
    @Published var value: String
    @Published var state: TypingState = .typing
    @Published var invalidTrigger: Bool = false
    
    private let type: CodeType
    private let onChangeHandler: (String) async -> TypingState
    
    init(
        initialValue: String = "",
        type: CodeType,
        onChangeHandler: @escaping (String) async -> TypingState
    ) {
        self.value = initialValue
        self.type = type
        self.onChangeHandler = onChangeHandler
    }
    
    func processValueChange(_ newValue: String) {
        let limitedValue = String(newValue.prefix(type.rawValue))
        
        value = limitedValue
        
        Task { @MainActor in
            let newState = await onChangeHandler(value)
            
            if newState == .invalid {
                state = newState
                invalidTrigger.toggle()
            } else {
                state = newState
            }
        }
    }
}
