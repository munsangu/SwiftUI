import SwiftUI

struct WaveFormView: View {
    @ObservedObject var viewModel: WaveViewModel
    
    var body: some View {
        TimelineView(.animation) { timeLine in
            Canvas { context, size in
                let timeNow = timeLine.date.timeIntervalSinceReferenceDate
                let angle = timeNow.remainder(dividingBy: 2)
                let offset = angle * size.width
                
                context.translateBy(
                    x: viewModel.isReversed ? -offset : offset,
                    y: 0
                )
                context.fill(
                    viewModel.getPath(size: size),
                    with: .color(viewModel.color)
                )
                
                context.translateBy(
                    x: -size.width,
                    y: 0
                )
                context.fill(
                    viewModel.getPath(size: size),
                    with: .color(viewModel.color)
                )
                
                context.translateBy(
                    x: size.width * 2,
                    y: 0
                )
                context.fill(
                    viewModel.getPath(size: size),
                    with: .color(viewModel.color)
                )
            }
        }
    }
}

#Preview {
    WaveFormView(
        viewModel: WaveViewModel(
            model: WaveModel(
                color: .blue.opacity(0.5),
                amplitude: 100,
                isReversed: false
            )
        )
    )
    .frame(height: 300)
}
