import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ClockViewModel()

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            Circle()
                .stroke(style: StrokeStyle(lineWidth: 10))
                .fill(Color.white)
                .frame(
                    width: 350,
                    height: 350
                )

            SecondsHand()
                .stroke(
                    style: StrokeStyle(
                        lineWidth: ClockHandType.second.lineWidth,
                        lineCap: .round
                    )
                )
                .foregroundColor(.white)
                .rotationEffect(.degrees(viewModel.secondAngle))

            MinutesHand()
                .stroke(
                    style: StrokeStyle(
                        lineWidth: ClockHandType.minute.lineWidth,
                        lineCap: .round
                    )
                )
                .foregroundColor(.white)
                .rotationEffect(.degrees(viewModel.minuteAngle))

            HoursHand()
                .stroke(
                    style: StrokeStyle(
                        lineWidth: ClockHandType.hour.lineWidth,
                        lineCap: .round
                    )
                )
                .foregroundColor(.white)
                .rotationEffect(.degrees(viewModel.hourAngle))
        }
    }
}

#Preview {
    ContentView()
}
