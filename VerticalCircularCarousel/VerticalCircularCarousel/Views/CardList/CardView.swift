import SwiftUI

struct CardView: View {
    private let card: Card
    
    private enum Constants {
        static let cornerRadius: CGFloat = 25
        static let padding: CGFloat = 25
        static let visaImageWidth: CGFloat = 40
        static let starText: String = "****"
        static let shadowRadius: CGFloat = 8
        static let shadowOpacity: CGFloat = 0.3
    }
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            cardBackground
            cardContent
        }
        .contentShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(card.color.gradient)
            .shadow(color: .black.opacity(Constants.shadowOpacity), radius: Constants.shadowRadius, x: 0, y: 4)
    }
    
    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 10) {
            cardLogo
            
            Spacer(minLength: 0)
            
            cardNumber
            
            cardOwnerInfo
        }
        .padding(Constants.padding)
    }
    
    private var cardLogo: some View {
        Image(.visa)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Constants.visaImageWidth)
            .accessibilityHidden(true)
    }
    
    private var cardNumber: some View {
        HStack(spacing: 0) {
            ForEach(0..<3, id: \.self) { _ in
                Text(Constants.starText)
                
                Spacer(minLength: 0)
            }
            
            Text(card.number)
                .offset(y: -2)
        }
        .font(.callout)
        .fontWeight(.bold)
                    .foregroundStyle(.white)
            .shadow(color: .black.opacity(0.3), radius: 1)
        .padding(.bottom, 10)
        .accessibilityLabel(Text("카드 번호 끝자리 \(card.number)"))
    }
    
    private var cardOwnerInfo: some View {
        HStack {
            Text(card.name)
                .accessibilityLabel(Text("카드 소유자 \(card.name)"))
            
            Spacer(minLength: 0)
            
            Text(card.date)
                .accessibilityLabel(Text("유효기간 \(card.date)"))
        }
        .font(.caption.bold())
        .foregroundStyle(.white)
    }
}

#Preview {
    CardView(Card(number: "1234", color: .red))
        .frame(width: 220, height: 150)
        .padding()
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
}
