import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RippleViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader { geometry in
                    let size = geometry.size
                    
                    ForEach(0...1, id: \.self) { index in
                        if viewModel.count == index {
                            imageView(index, size: size)
                                .transition(.ripple(location: viewModel.rippleLocation))
                        }
                    }
                }
                .frame(width: 350, height: 500)
                .coordinateSpace(.named("VIEW"))
                .onTapGesture(count: 1, coordinateSpace: .named("VIEW")) { location in
                    viewModel.handleTap(at: location)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottomTrailing) {
                GeometryReader { proxy in
                    let frame = proxy.frame(in: .global)
                    
                    Button {
                        viewModel.handleOverlayButtonTap(from: frame)
                    } label: {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            .background(.indigo.gradient, in: .circle)
                            .contentShape(.rect)
                    }
                }
                .frame(width: 50, height: 50)
                .padding(15)
            }
            .navigationTitle("Ripple Transition")
        }
        .overlay {
            if viewModel.showOverlayView {
                ZStack {
                    Rectangle()
                        .fill(.indigo.gradient)
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.dismissOverlay()
                        }
                    
                    Text("Tap anywhere to dismiss!")
                        .font(.title2)
                        .foregroundStyle(.white)
                }
                .transition(.reverseRipple(location: viewModel.overlayRippleLocation))
            }
        }
    }
    
    private func imageView(_ index: Int, size: CGSize) -> some View {
        Image("Pic\(index + 1)")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    ContentView()
}
