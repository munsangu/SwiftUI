import SwiftUI

struct CardListView: View {
    @StateObject private var viewModel = CardListViewModel()
    @State private var selectedCardID: UUID?

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.cards) { card in
                        CardView(card)
                            .frame(
                                width: 220,
                                height: 150
                            )
                            .visualEffect { content, geometryProxy in
                                content
                                    .offset(x: -150)
                                    .rotationEffect(
                                        .init(degrees: viewModel.calculateCardRotation(for: geometryProxy)),
                                        anchor: .trailing
                                    )
                                    .offset(
                                        x: 100,
                                        y: -geometryProxy
                                        .frame(in: .scrollView(axis: .vertical))
                                        .minY
                                    )
                            }
                            .frame(
                                maxWidth: .infinity,
                                alignment: .trailing
                            )
                            .id(card.id)
                            .onTapGesture {
                                selectedCardID = card.id
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(
                .vertical,
                (size.height * 0.5) - 75
            )
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .background {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(
                        width: size.height,
                        height: size.height
                    )
                    .offset(x: size.height / 2)
            }

            VStack(
                alignment: .leading,
                spacing: 12
            ) {
                BackButton(action: {})
                
                Text("Total")
                    .font(.title3.bold())
                    .padding(
                        .top,
                        10
                    )
                
                Text(viewModel.totalAmount)
                    .font(.largeTitle)
                
                Text("Choose a card")
                    .font(.caption2)
            }
            .padding(.leading)
        }
        .foregroundStyle(.white)
        .toolbar(
            .hidden,
            for: .navigationBar
        )
    }
}

#Preview {
    CardListView()
        .preferredColorScheme(.dark)
}
