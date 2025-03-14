import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ChartViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Picker(
                    "CHART TYPE",
                    selection: $viewModel.selectedChartType.animation()
                ) {
                    ForEach(ChartType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .onChange(of: viewModel.selectedChartType) { _, newValue in
                    viewModel.changeChartType(to: newValue)
                }
                
                Text("Data")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(.horizontal)
                
                chartView
                    .padding()
                    .background(
                        Color(.systemBackground),
                        in: .rect(cornerRadius: 10)
                    )
                
                Spacer(minLength: 0)
            }
            .padding()
            .background(Color(.systemGray6))
            .navigationTitle("Animated Chart's")
            .onAppear {
                viewModel.startChartAnimation()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Trigger") {
                        viewModel.triggerNewData()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var chartView: some View {
        switch viewModel.selectedChartType {
        case .bar:
            BarChartView(viewModel: viewModel)
        case .line:
            LineChartView(viewModel: viewModel)
        case .pie:
            PieChartView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}
