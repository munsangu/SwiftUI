import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RollingCounterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                RollingText(
                    font: .system(size: 55),
                    weight: .black,
                    value: $viewModel.displayValue
                )
                
                Button("Change Value") {
                    viewModel.changeToRandomValue()
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding()
            .navigationTitle("Rolling Counter")
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .opacity(configuration.isPressed ? 0.7 : 1)
            )
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.spring(), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
