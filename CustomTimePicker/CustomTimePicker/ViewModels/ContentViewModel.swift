import Foundation
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var timePickerViewModel: TimePickerViewModel
    let backgroundOpacity: Double = 0.15
    let timePickerPadding: CGFloat = 15
    let timePickerCornerRadius: CGFloat = 10
    let horizontalPadding: CGFloat = 20
    private var cancellables = Set<AnyCancellable>()
    
    init(
        initialHours: Int = 0,
        initialMinutes: Int = 30,
        initialSeconds: Int = 25
    ) {
        self.timePickerViewModel = TimePickerViewModel(
            initialHours: initialHours,
            initialMinutes: initialMinutes,
            initialSeconds: initialSeconds
        )
        setupBindings()
    }
    
    func onTimeChanged(
        hours: Int? = nil,
        minutes: Int? = nil,
        seconds: Int? = nil
    ) {
        timePickerViewModel.updateTime(
            hours: hours,
            minutes: minutes,
            seconds: seconds
        )
    }
     
    var currentTimeModel: TimeModel {
        timePickerViewModel.timeModel
    }
    
    private func setupBindings() {}
}
