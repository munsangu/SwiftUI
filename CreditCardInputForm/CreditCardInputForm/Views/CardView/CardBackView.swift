import SwiftUI

struct CardBackView: View {
    let card: Card
    
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .fill(.black)
                .frame(height: 45)
                .padding(
                    .horizontal,
                    -15
                )
                .padding(
                    .top,
                    10
                )
            
            VStack(
                alignment: .trailing,
                spacing: 6
            ) {
                Text("CVV")
                    .font(.caption)
                    .padding(
                        .trailing,
                        10
                    )
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .frame(height: 45)
                    .overlay(alignment: .trailing) {
                        Text(
                            String(
                                card.cvv
                                    .prefix(3)
                            )
                            .dummyText(
                                "*",
                                count: 3
                            )
                        )
                        .foregroundStyle(.black)
                        .padding(
                            .trailing,
                            15
                        )
                    }
            }
            .foregroundStyle(.white)
            .monospaced()
            
            Spacer(minLength: 0)
        }
        .padding(15)
        .contentTransition(.numericText())
        .animation(
            .snappy,
            value: card
        )
    }
}
