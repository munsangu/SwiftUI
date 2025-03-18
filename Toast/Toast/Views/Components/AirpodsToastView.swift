import SwiftUI

struct AirpodsToastView: View {
    let id: String
    let icon: String
    let message: String
    let color: Color
    var showCloseButton: Bool = true
    let onClose: () -> Void
    
    private var isCompactStyle: Bool {
        return message.contains("'s Airpods")
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
            
            Text(message)
                .font(.callout)
            
            Spacer(minLength: 0)
            
            if showCloseButton {
                Button(action: onClose) {
                    Image(systemName: "xmark")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(6)
                        .background(Circle().fill(Color(UIColor.systemBackground).opacity(0.3)))
                }
            }
        }
        .foregroundStyle(.primary)
        .padding(.vertical, 12)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(.background)
                .shadow(
                    color: .black.opacity(0.06),
                    radius: 3,
                    x: -1,
                    y: -3
                )
                .shadow(
                    color: .black.opacity(0.06),
                    radius: 2,
                    x: 1,
                    y: 3
                )
        }
        .frame(width: isCompactStyle ? 200 : nil)
        .padding(.horizontal, isCompactStyle ? 0 : 15)
        .frame(maxWidth: isCompactStyle ? .infinity : .infinity, alignment: isCompactStyle ? .center : .leading)
    }
}

#Preview {
    VStack(spacing: 20) {
        AirpodsToastView(
            id: "preview1",
            icon: "bolt.slash.fill",
            message: "Your Airpods Battery is low.",
            color: .red,
            onClose: {}
        )
        
        AirpodsToastView(
            id: "preview2",
            icon: "bolt.fill",
            message: "Airpods is fully charged.",
            color: .green,
            onClose: {}
        )
        
        AirpodsToastView(
            id: "preview3",
            icon: "heart.fill",
            message: "Optmized Airpods charging.",
            color: .yellow,
            onClose: {}
        )
        
        AirpodsToastView(
            id: "preview4",
            icon: "airpodspro",
            message: "SW's Airpods",
            color: .gray,
            showCloseButton: false,
            onClose: {}
        )
    }
    .padding()
    .background(Color(UIColor.systemGroupedBackground))
}
