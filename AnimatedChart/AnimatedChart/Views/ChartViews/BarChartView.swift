import SwiftUI
import Charts

struct BarChartView: View {
    @ObservedObject var viewModel: ChartViewModel
    
    var body: some View {
        Chart {
            ForEach(
                Array(
                    viewModel.downloads.enumerated()
                ),
                id: \.element.id
            ) { index, download in
                BarMark(
                    x: .value(
                        "Month",
                        download.month
                    ),
                    y: .value(
                        "Downloads",
                        download.isAnimated ?
                        download.value :
                        0
                    )
                )
                .foregroundStyle(
                    viewModel
                        .color(for: index)
                        .gradient
                )
            }
        }
        .frame(height: 200)
        .chartYScale(domain: 0...viewModel.maxYValue)
        .chartYAxis {
            AxisMarks(
                position: .leading,
                values: viewModel.yAxisSteps
            ) { value in
                AxisGridLine()
                AxisValueLabel() {
                    if let intValue = value.as(Int.self) {
                        Text("\(intValue)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    BarChartView(viewModel: ChartViewModel())
        .frame(height: 250)
        .padding()
}
