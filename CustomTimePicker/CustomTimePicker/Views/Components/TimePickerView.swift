import SwiftUI

struct TimePickerView: View {
    var style: AnyShapeStyle = .init(.bar)
    @ObservedObject var viewModel: TimePickerViewModel
    private let horizontalOffset: CGFloat = -25
    private let backgroundHeight: CGFloat = 35
    private let cornerRadius: CGFloat = 10
    
    var body: some View {
        HStack(spacing: 0) {
            createTimePicker(
                title: "hours",
                range: viewModel.hoursRange,
                selection: Binding(
                    get: { viewModel.timeModel.hours },
                    set: { viewModel.updateTime(hours: $0) }
                )
            )
            
            createTimePicker(
                title: "mins",
                range: viewModel.minutesSecondsRange,
                selection: Binding(
                    get: { viewModel.timeModel.minutes },
                    set: { viewModel.updateTime(minutes: $0) }
                )
            )
            
            createTimePicker(
                title: "secs",
                range: viewModel.minutesSecondsRange,
                selection: Binding(
                    get: { viewModel.timeModel.seconds },
                    set: { viewModel.updateTime(seconds: $0) }
                )
            )
        }
        .offset(x: horizontalOffset)
        .background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(style)
                .frame(height: backgroundHeight)
        }
    }
    
    @ViewBuilder
    private func createTimePicker(
        title: String,
        range: ClosedRange<Int>,
        selection: Binding<Int>
    ) -> some View {
        PickerViewWithoutIndicator(selection: selection) {
            ForEach(range, id: \.self) { value in
                Text("\(value)")
                    .frame(
                        width: viewModel.fieldWidth,
                        alignment: .leading
                    )
                    .tag(value)
            }
        }
        .overlay {
            Text(title)
                .font(.callout.bold())
                .frame(
                    width: viewModel.labelWidth,
                    alignment: .leading
                )
                .lineLimit(1)
                .offset(x: viewModel.labelWidth)
        }
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView(
            viewModel: TimePickerViewModel(
                initialHours: 10,
                initialMinutes: 30,
                initialSeconds: 15
            )
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
