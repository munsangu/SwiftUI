import SwiftUI

struct ToastItemView: View {
    let id: String
    let type: ToastType
    let onClose: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: type.icon)
                .foregroundColor(type.color)
            
            Text(type.message)
                .foregroundColor(.white)
                .font(.subheadline)
            
            Spacer(minLength: 8)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemBackground).opacity(0.9))
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    VStack {
        ToastItemView(id: "preview", type: .error, onClose: {})
        ToastItemView(id: "preview", type: .success, onClose: {})
        ToastItemView(id: "preview", type: .warning, onClose: {})
        ToastItemView(id: "preview", type: .appleLikeHUD, onClose: {})
        ToastItemView(
            id: "preview",
            type: .custom(
                icon: "star.fill",
                message: "Custom Toast",
                color: .purple
            ),
            onClose: {}
        )
    }
    .preferredColorScheme(.dark)
}
