import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DrumPadViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            LazyVGrid(
                columns: columns,
                spacing: 24
            ) {
                ForEach(viewModel.pads) { pad in
                    Button(action: {
                        viewModel.playSound(for: pad)
                    }) {
                        Text(pad.label)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .frame(
                                width: 140,
                                height: 140
                            )
                            .background(Color.gray.opacity(0.9))
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
