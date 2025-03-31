import SwiftUI

struct TabItemView: View {
    let tab: Tab
    let isActive: Bool
    let isAnimating: Bool?
    let bounceDown: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: tab.rawValue)
                .font(.title2)
                .symbolEffect(
                    bounceDown ?
                    .bounce.down.byLayer:
                    .bounce.up.byLayer,
                    value: isAnimating
                )
            
            Text(tab.title)
                .font(.caption2)
                .textScale(.secondary)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(
            isActive ?
            Color.primary :
            Color.gray.opacity(0.8)
        )
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}
