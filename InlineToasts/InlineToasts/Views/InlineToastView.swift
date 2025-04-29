import SwiftUI

struct InlineToastView: View {
    var config: InlineToastConfig
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: config.icon)
                .font(.title2)
                .foregroundStyle(config.tint)
            
            VStack(
                alignment: .leading,
                spacing: 5
            ) {
                Text(config.title)
                    .font(.callout)
                    .fontWeight(.semibold)
                
                if !config.subTitle.isEmpty {
                    Text(config.subTitle)
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: config.actionHandler) {
                Image(systemName: config.actionIcon)
                    .foregroundStyle(.gray)
                    .contentShape(.rect)
            }
        }
        .padding()
        .background {
            ZStack {
                Rectangle()
                    .fill(.background)
                
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(config.tint)
                        .frame(width: 5)
                    
                    Rectangle()
                        .fill(config.tint.opacity(0.15))
                }
            }
            .contentShape(.rect)
        }
    }
}

#Preview {
    InlineToastView(config:
                        InlineToastConfig(
                            icon: "square.and.arrow.down.badge.clock",
                            title: "TEST",
                            subTitle: "TEST",
                            tint: .red,
                            actionIcon: "folder"
                        )
    )
}
