import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CardsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                cardScrollView
                controlPanelView
            }
            .navigationTitle("Stacked Cards")
        }
    }
    
    private var cardScrollView: some View {
        GeometryReader { geometryProxy in
            let size = geometryProxy.size
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(viewModel.cards) { card in
                        CardView(card)
                            .padding(.horizontal, 65)
                            .frame(width: size.width)
                            .visualEffect { content, proxy in
                                content
                                    .scaleEffect(
                                        viewModel.scale(proxy, scale: 0.1),
                                        anchor: .trailing
                                    )
                                    .rotationEffect(
                                        viewModel.rotation(
                                            proxy,
                                            rotation: viewModel.isRotationEnabled ? 5 : 0
                                        )
                                    )
                                    .offset(x: viewModel.minX(proxy))
                                    .offset(
                                        x: viewModel.excessMinX(
                                            proxy,
                                            offset: viewModel.isRotationEnabled ? 8 : 10
                                        )
                                    )
                            }
                            .zIndex(viewModel.zIndex(for: card))
                    }
                }
                .padding(.vertical, 15)
            }
            .scrollTargetBehavior(.paging)
            .scrollIndicators(viewModel.showsIndicator ? .visible : .hidden)
            .scrollIndicatorsFlash(trigger: viewModel.showsIndicator)
        }
        .frame(height: 410)
        .animation(.snappy, value: viewModel.isRotationEnabled)
    }
    
    private var controlPanelView: some View {
        VStack(spacing: 20) {
            Toggle("Rotation Enabled", isOn: $viewModel.isRotationEnabled)
            Toggle("Shows Scroll Indicator", isOn: $viewModel.showsIndicator)
        }
        .padding(15)
        .background(.bar, in: .rect(cornerRadius: 10))
        .padding(15)
    }
}

#Preview {
    ContentView()
}
