import SwiftUI
import Combine

final class ClockViewModel: ObservableObject {
    @Published var secondAngle: Double = 0
    @Published var minuteAngle: Double = 0
    @Published var hourAngle: Double = 0

    private var timer: AnyCancellable?

    init() {
        updateTime()
        startClock()
    }

    private func startClock() {
        timer = Timer
            .publish(
                every: 1,
                on: .main,
                in: .common
            )
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTime()
            }
    }

    private func updateTime() {
        let koreaTimeZone = TimeZone(identifier: "Asia/Seoul")!
        let calendar = Calendar.current
        var components = calendar.dateComponents(
            in: koreaTimeZone,
            from: Date()
        )

        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0

        secondAngle = Double(second) * 6
        minuteAngle = Double(minute) * 6 + Double(second) * 0.1
        hourAngle = Double(hour % 12) * 30 + Double(minute) * 0.5
    }
}
