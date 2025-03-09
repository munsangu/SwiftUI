import SwiftUI

struct CardFrontView: View {
    let card: Card
    let animateField: ActiveField?
    let animation: Namespace.ID
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 15
        ) {
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                Text("CARD NUMBER")
                    .font(.caption)
                
                Text(
                    String(
                        card.rawCardNumber
                            .dummyText("*", count: 16)
                            .prefix(16)
                    )
                    .group(" ", count: 4)
                )
                .font(.title2)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .leading
            )
            .padding(10)
            .background(AnimatedRing(isActive: animateField == .number, animation: animation))
            
            
            HStack(spacing: 10) {
                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {
                    Text("CARD HOLDER")
                        .font(.caption)
                    
                    Text(
                        card.name.isEmpty ?
                        "YOUR NAME"
                        : card.name
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .background(AnimatedRing(isActive: animateField == .name, animation: animation))
                
                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {
                    Text("EXPIRES")
                        .font(.caption)
                    
                    HStack(spacing: 4) {
                        Text(
                            String(
                                card.month
                                    .prefix(2)
                            )
                                .dummyText(
                                    "M",
                                    count: 2
                                )
                        )
                        Text("/")
                        Text(
                            String(
                                card.year
                                    .prefix(2)
                            )
                                .dummyText(
                                    "Y",
                                    count: 2
                                )
                        )
                    }
                }
                .padding(10)
                .background(AnimatedRing(isActive: animateField == .month || animateField == .year, animation: animation))
            }
        }
        .foregroundStyle(.white)
        .monospaced()
        .contentTransition(.numericText())
        .animation(
            .snappy,
            value: card
        )
        .padding(15)
    }
}
