import SwiftUI

struct SecondsHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(
            to: CGPoint(
                x: rect.midX,
                y: rect.midY
            )
        )
        path.addLine(
            to: CGPoint(
                x: rect.midX,
                y: rect.midY - ClockHandType.second.length
            )
        )
        return path
    }
}

struct MinutesHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(
            to: CGPoint(
                x: rect.midX,
                y: rect.midY
            )
        )
        path.addLine(
            to: CGPoint(
                x: rect.midX,
                y: rect.midY - ClockHandType.minute.length
            )
        )
        return path
    }
}

struct HoursHand: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(
            to: CGPoint(
                x: rect.midX,
                y: rect.midY
            )
        )
        path.addLine(
            to: CGPoint(
                x: rect.midX,
                y: rect.midY - ClockHandType.hour.length
            )
        )
        return path
    }
}
