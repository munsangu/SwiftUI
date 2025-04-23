import SwiftUI

func OverlayView(_ card: TripCard) -> some View {
    ZStack(alignment: .bottomLeading) {
        LinearGradient(
            colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.5),
                .black
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        
        VStack(
            alignment: .leading,
            spacing: 4
        ) {
            Text(card.title)
                .font(.title2)
                .fontWeight(.black)
                .foregroundStyle(.white)
            
            Text(card.subtitle)
                .font(.callout)
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding(20)
    }
}

#Preview {
    OverlayView(
        TripCard(
            title: "Test",
            subtitle: "Subtitle",
            image: "Pic1"
        )
    )
}
