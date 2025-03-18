import SwiftUI

enum ToastType {
    case error
    case success
    case warning
    case appleLikeHUD
    case custom(icon: String, message: String, color: Color)
    
    var icon: String {
        switch self {
        case .error:
            return "exclamationmark.triangle.fill"
        case .success:
            return "checkmark.circle.fill"
        case .warning:
            return "exclamationmark.circle.fill"
        case .appleLikeHUD:
            return "applelogo"
        case .custom(let icon, _, _):
            return icon
        }
    }
    
    var color: Color {
        switch self {
        case .error:
            return .red
        case .success:
            return .green
        case .warning:
            return .yellow
        case .appleLikeHUD:
            return .blue
        case .custom(_, _, let color):
            return color
        }
    }
    
    var message: String {
        switch self {
        case .error:
            return "오류가 발생했습니다"
        case .success:
            return "성공적으로 완료되었습니다"
        case .warning:
            return "주의가 필요합니다"
        case .appleLikeHUD:
            return "Apple 기기 연결됨"
        case .custom(_, let message, _):
            return message
        }
    }
}
