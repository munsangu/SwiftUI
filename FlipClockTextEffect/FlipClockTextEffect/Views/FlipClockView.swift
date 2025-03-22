import SwiftUI

struct FlipClockView: View {
    @ObservedObject var viewModel: ClockViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 0) {
                FlipClockTextEffect(
                    value: .constant(viewModel.currentTime.hourFirstDigit),
                    size: viewModel.clockSize,
                    fontSize: viewModel.fontSize,
                    cornerRadius: viewModel.cornerRadius,
                    foreground: viewModel.foregroundColor,
                    background: viewModel.backgroundColor,
                    animationDuration: viewModel.animationDuration
                )
                
                FlipClockTextEffect(
                    value: .constant(viewModel.currentTime.hourSecondDigit),
                    size: viewModel.clockSize,
                    fontSize: viewModel.fontSize,
                    cornerRadius: viewModel.cornerRadius,
                    foreground: viewModel.foregroundColor,
                    background: viewModel.backgroundColor,
                    animationDuration: viewModel.animationDuration
                )
                
                colonView()
                
                FlipClockTextEffect(
                    value: .constant(viewModel.currentTime.minuteFirstDigit),
                    size: viewModel.clockSize,
                    fontSize: viewModel.fontSize,
                    cornerRadius: viewModel.cornerRadius,
                    foreground: viewModel.foregroundColor,
                    background: viewModel.backgroundColor,
                    animationDuration: viewModel.animationDuration
                )
                
                FlipClockTextEffect(
                    value: .constant(viewModel.currentTime.minuteSecondDigit),
                    size: viewModel.clockSize,
                    fontSize: viewModel.fontSize,
                    cornerRadius: viewModel.cornerRadius,
                    foreground: viewModel.foregroundColor,
                    background: viewModel.backgroundColor,
                    animationDuration: viewModel.animationDuration
                )
                
                colonView()
                
                FlipClockTextEffect(
                    value: .constant(viewModel.currentTime.secondFirstDigit),
                    size: viewModel.clockSize,
                    fontSize: viewModel.fontSize,
                    cornerRadius: viewModel.cornerRadius,
                    foreground: viewModel.foregroundColor,
                    background: viewModel.backgroundColor,
                    animationDuration: viewModel.animationDuration
                )
                
                FlipClockTextEffect(
                    value: .constant(viewModel.currentTime.secondSecondDigit),
                    size: viewModel.clockSize,
                    fontSize: viewModel.fontSize,
                    cornerRadius: viewModel.cornerRadius,
                    foreground: viewModel.foregroundColor,
                    background: viewModel.backgroundColor,
                    animationDuration: viewModel.animationDuration
                )
            }
        }
        .padding(.horizontal, 10)
        .background(Color.black)
    }
    
    @ViewBuilder
    private func colonView() -> some View {
        Text(":")
            .font(
                .system(
                    size: viewModel.fontSize,
                    weight: .bold
                )
            )
            .foregroundColor(.white)
            .frame(width: 20)
    }
}

#Preview {
    FlipClockView(viewModel: ClockViewModel())
        .preferredColorScheme(.dark)
}
