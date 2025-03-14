import SwiftUI
import Charts

struct LineChartView: View {
    @ObservedObject var viewModel: ChartViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.downloads) { download in
                LineMark(
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
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.green.gradient)
                
                PointMark(
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
                .foregroundStyle(.green)
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
    LineChartView(viewModel: ChartViewModel())
        .frame(height: 250)
        .padding()
}
