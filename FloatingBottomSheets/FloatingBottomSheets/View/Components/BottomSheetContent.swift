import SwiftUI

struct BottomSheetContent: View {
    let config: SheetConfiguration
    let dismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: config.image.content)
                .font(.title)
                .foregroundStyle(config.image.foreground)
                .frame(width: 65, height: 65)
                .background(config.image.tint.gradient, in: .circle)
            
            Text(config.title)
                .font(.title3.bold())
            
            Text(config.content)
                .font(.callout)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .foregroundStyle(.gray)
                .padding(.horizontal)
            
            ActionButton(
                config: config.primaryButton,
                action: dismiss
            )
            
            if let secondaryConfig = config.secondaryButton {
                ActionButton(
                    config: secondaryConfig,
                    action: dismiss
                )
            }
        }
        .padding([.horizontal, .bottom], 15)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
                .padding(.top, 30)
        }
        .shadow(color: .black.opacity(0.12), radius: 8)
        .padding(.horizontal, 15)
    }
}

#Preview {
    BottomSheetContent(
        config: SheetType.question.configuration,
        dismiss: {}
    )
    .previewLayout(.sizeThatFits)
}
