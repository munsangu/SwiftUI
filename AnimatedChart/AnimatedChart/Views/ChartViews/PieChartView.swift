import SwiftUI
import Charts

struct PieChartView: View {
    @ObservedObject var viewModel: ChartViewModel

    var body: some View {
        VStack(spacing: 10) {
            Chart {
                ForEach(
                    Array(
                        viewModel.downloads.enumerated()
                    ),
                    id: \.element.id
                ) { index, download in
                    SectorMark(
                        angle: .value(
                            "Downloads",
                            download.isAnimated ?
                            download.value :
                            0
                        ),
                        innerRadius: .ratio(0.5),
                        angularInset: 1.5
                    )
                    .foregroundStyle(
                        viewModel
                            .color(for: index)
                            .gradient
                    )
                    .opacity(download.isAnimated ? 1 : 0)
                }
            }
            .frame(height: 200)
            
            ChartLegendView(viewModel: viewModel)
                .padding(.top, 5)
        }
    }
}

#Preview {
    PieChartView(viewModel: ChartViewModel())
        .frame(height: 250)
        .padding()
}
