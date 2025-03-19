import SwiftUI

enum TransactionState: String {
    case idle = "Click to pay"
    case analyzing = "Analyzing Transaction"
    case processing = "Processing Transaction"
    case completed = "Transaction Completed"
    case failed = "Transaction Failed"
    
    var color: Color {
        switch self {
        case .idle:
            return .black
        case .analyzing:
            return .blue
        case .processing:
            return Color(
                red: 0.8,
                green: 0.35,
                blue: 0.2
            )
        case .completed:
            return .green
        case .failed:
            return .red
        }
    }
    
    var image: String? {
        switch self {
        case .idle:
            return "apple.logo"
        case .analyzing, .processing:
            return nil
        case .completed:
            return "checkmark.circle.fill"
        case .failed:
            return "xmark.circle.fill"
        }
    }
}
