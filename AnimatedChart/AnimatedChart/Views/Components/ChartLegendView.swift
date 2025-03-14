import SwiftUI

struct ChartLegendView: View {
    @ObservedObject var viewModel: ChartViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(Array(viewModel.downloads.enumerated()), id: \.element.id) { index, download in
                HStack(spacing: 4) {
                    Circle()
                        .fill(viewModel.color(for: index))
                        .frame(width: 8, height: 8)
                    
                    Text(download.month)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

#Preview {
    ChartLegendView(viewModel: ChartViewModel())
        .padding()
}
