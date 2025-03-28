import SwiftUI
import Combine

class TimePickerViewModel: ObservableObject {
    @Published var timeModel: TimeModel
    let hoursRange: ClosedRange<Int> = 0...24
    let minutesSecondsRange: ClosedRange<Int> = 0...59
    let fieldWidth: CGFloat = 35
    let labelWidth: CGFloat = 50
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        initialHours: Int = 0,
        initialMinutes: Int = 0,
        initialSeconds: Int = 0
    ) {
        self.timeModel = TimeModel(
            hours: initialHours,
            minutes: initialMinutes,
            seconds: initialSeconds
        )
        setupBindings()
    }
    
    func updateTime(
        hours: Int? = nil,
        minutes: Int? = nil,
        seconds: Int? = nil
    ) {
        var updatedModel = timeModel
        
        if let hours = hours {
            updatedModel.hours = max(0, min(hours, 24))
        }
        
        if let minutes = minutes {
            updatedModel.minutes = max(0, min(minutes, 59))
        }
        
        if let seconds = seconds {
            updatedModel.seconds = max(0, min(seconds, 59))
        }
        
        timeModel = updatedModel
    }
    
    private func setupBindings() {
        $timeModel
            .sink { [weak self] _ in
                self?.validateTimeValues()
            }
            .store(in: &cancellables)
    }
    
    private func validateTimeValues() {
        let validHours = max(0, min(timeModel.hours, 24))
        let validMinutes = max(0, min(timeModel.minutes, 59))
        let validSeconds = max(0, min(timeModel.seconds, 59))
        
        if validHours != timeModel.hours ||
            validMinutes != timeModel.minutes ||
            validSeconds != timeModel.seconds
        {
            timeModel = TimeModel(
                hours: validHours,
                minutes: validMinutes,
                seconds: validSeconds
            )
        }
    }
}
