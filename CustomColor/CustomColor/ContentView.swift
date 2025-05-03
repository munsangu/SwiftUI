import SwiftUI

struct ContentView: View {
    @State private var colorValue: Double = 0.5
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.teal)
                .frame(height: 100)

            RoundedRectangle(cornerRadius: 15)
                .fill(.teal.gradient)
                .frame(height: 100)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.teal.mix(with: .indigo, by: colorValue))
                .frame(height: 100)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.teal)
                .brightness(colorValue)
                .frame(height: 100)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.teal)
                .grayscale(colorValue)
                .frame(height: 100)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.teal.secondary)
                .frame(height: 100)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.teal.tertiary)
                .frame(height: 100)
            
            Slider(
                value: $colorValue,
                in: 0...1
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
