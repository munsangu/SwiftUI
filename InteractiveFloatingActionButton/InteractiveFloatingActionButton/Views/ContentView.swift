import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 15) {
                    ForEach(viewModel.colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(color.gradient)
                            .frame(height: 200)
                    }
                }
                .padding(15)
            }
            .navigationTitle("Floating Button")
        }
        .overlay(alignment: .bottomTrailing) {
            floatingButtonView
        }
    }
    
    private var floatingButtonView: some View {
        FloatingButtonView {
            viewModel.trayActionModel
            viewModel.sparkActionModel
            viewModel.shareActionModel
        } label: { isExpanded in
            Image(systemName: "plus")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                .scaleEffect(1.02)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black, in: .circle)
                .scaleEffect(isExpanded ? 0.9 : 1)
        }
        .padding()
    }
}
