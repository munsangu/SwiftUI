import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SoundButtonViewModel()

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                ForEach(viewModel.buttons) { button in
                    Button(action: {
                        viewModel.playSound(for: button)
                    }) {
                        Text(button.title)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.8))
                            .cornerRadius(12)
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
