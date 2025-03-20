import Foundation
import Combine

class RollingCounterViewModel: ObservableObject {
    @Published var displayValue: Int
    private var model: RollingNumberModel
    private var cancellables = Set<AnyCancellable>()
    
    init(initialValue: Int = 0) {
        self.model = RollingNumberModel(initialValue: initialValue)
        self.displayValue = initialValue
    }
    
    func changeToRandomValue(in range: ClosedRange<Int> = 200...1300) {
        let newValue = model.updateToRandomValue(in: range)
        displayValue = newValue
    }
    
    func changeValue(to value: Int) {
        let newValue = model.updateValue(to: value)
        displayValue = newValue
    }
}
