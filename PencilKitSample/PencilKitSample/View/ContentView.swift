import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CanvasViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    viewModel.clearCanvas()
                }) {
                    Text("Clear")
                        .padding(8)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Spacer(minLength: 0)

                Button(action: {
                    if let image = viewModel.exportImage() {
                        print("Saved Image: \(image)")
                    }
                }) {
                    Text("Save")
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(15)

            CanvasUIView(viewModel: viewModel)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            Color.black.opacity(0.5),
                            lineWidth: 1
                        )
                )
                .padding(20)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
