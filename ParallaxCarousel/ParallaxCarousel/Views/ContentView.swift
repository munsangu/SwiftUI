import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                    
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        
                        TextField("Search", text: $searchText)
                    }
                    .padding(
                        .horizontal,
                        15
                    )
                    .padding(
                        .vertical,
                        10
                    )
                    .background(
                        .ultraThinMaterial,
                        in: .capsule
                    )
                }
                
                Text("Where do you want to \ntravel?")
                    .font(.largeTitle.bold())
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(
                        .top,
                        10
                    )
                
                GeometryReader { geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(tripCards) { card in
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    let minX = min(
                                        ((proxy.frame(in: .scrollView).minX - 30.0) * 1.4),
                                        size.width * 1.4
                                    )
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: proxy.size.width * 2.5)
                                        .frame(
                                            width: cardSize.width,
                                            height: cardSize.height
                                        )
                                        .overlay {
                                            OverlayView(card)
                                        }
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(
                                            color: .black.opacity(0.25),
                                            radius: 8,
                                            x: 5,
                                            y: 10
                                        )
                                }
                                .frame(
                                    width: size.width - 60,
                                    height: size.height - 50
                                )
                                .scrollTransition(
                                    .interactive,
                                    axis: .horizontal
                                ) { view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(
                            .horizontal,
                            30
                        )
                        .scrollTargetLayout()
                        .frame(
                            height: size.height,
                            alignment: .top
                        )
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                }
                .frame(height: 500)
                .padding(
                    .horizontal,
                    -15
                )
                .padding(
                    .top,
                    10
                )
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
