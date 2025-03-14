import Foundation

enum ChartType: String, CaseIterable, Identifiable {
    case bar = "Bar"
    case line = "Line"
    case pie = "Pie"
    var id: String { self.rawValue }
}
