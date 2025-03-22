import Foundation
import Combine
import SwiftUI

class ClockViewModel: ObservableObject {
    @Published var currentTime: TimeModel = TimeModel()
    private var timer: AnyCancellable?
    
    let clockSize = CGSize(
        width: 45,
        height: 70
    )
    let fontSize: CGFloat = 40
    let cornerRadius: CGFloat = 8
    let foregroundColor: Color = .white
    let backgroundColor: Color = .blue
    let animationDuration: CGFloat = 0.5
    
    init() {
        updateCurrentTime()
        startTimer()
    }
    
    deinit {
        timer?.cancel()
    }
    
    private func startTimer() {
        timer = Timer.publish(
            every: 1,
            on: .main,
            in: .common
        )
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateCurrentTime()
            }
    }
    
    private func updateCurrentTime() {
        let newTime = TimeModel(date: Date())
        if currentTime != newTime {
            currentTime = newTime
        }
    }
}
