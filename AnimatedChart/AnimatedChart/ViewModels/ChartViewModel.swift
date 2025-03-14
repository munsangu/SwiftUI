import SwiftUI
import Combine

final class ChartViewModel: ObservableObject {
    @Published var downloads: [Download] = []
    @Published var isAnimated: Bool = false
    @Published var selectedChartType: ChartType = .bar
    
    let chartColors: [Color] = [
        .blue, .green, .orange, .purple, .red, .teal
    ]
    let maxYValue: Double = 10000
    let yAxisSteps: [Double] = [0, 2500, 5000, 7500, 10000]
    
    init() {
        loadInitialData()
    }
    
    func loadInitialData() {
        downloads = [
            .init(
                date: .createDate(1, 8, 2024),
                value: 2500
            ),
            .init(
                date: .createDate(1, 9, 2024),
                value: 3500
            ),
            .init(
                date: .createDate(1, 10, 2024),
                value: 1500
            ),
            .init(
                date: .createDate(1, 11, 2024),
                value: 9500
            ),
            .init(
                date: .createDate(1, 12, 2024),
                value: 1950
            ),
            .init(
                date: .createDate(1, 1, 2025),
                value: 5100
            )
        ]
    }
    
    func triggerNewData() {
        resetChartAnimation()
        startChartAnimation()
    }
    
    func changeChartType(to type: ChartType) {
        resetChartAnimation()
        selectedChartType = type
        startChartAnimation()
    }
    
    func startChartAnimation() {
        guard !isAnimated else { return }
        isAnimated = true
        
        for index in downloads.indices {
            let delay = Double(index) * 0.1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(
                    .spring(response: 0.8,
                            dampingFraction: 0.8)
                ) {
                    self.downloads[index].isAnimated = true
                }
            }
        }
    }
    
    func resetChartAnimation() {
        for index in downloads.indices {
            downloads[index].isAnimated = false
        }
        
        isAnimated = false
    }
    
    func color(for index: Int) -> Color {
        chartColors[index % chartColors.count]
    }
}
