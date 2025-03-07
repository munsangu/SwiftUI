import SwiftUI

struct ActionButton: View {
    let config: ButtonConfig
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(config.content)
                .fontWeight(.bold)
                .foregroundStyle(config.foreground)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(config.tint.gradient, in: .rect(cornerRadius: 10))
        }
    }
}

#Preview {
    VStack {
        ActionButton(
            config: ButtonConfig(
                content: "Accept",
                tint: .green,
                foreground: .white
            ),
            action: {}
        )
        
        ActionButton(
            config: ButtonConfig(
                content: "Cancel",
                tint: Color.primary.opacity(0.08),
                foreground: .primary
            ),
            action: {}
        )
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
