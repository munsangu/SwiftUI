import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SliderViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomSlider(
                    value: $viewModel.value,
                    in: viewModel.range,
                    config: viewModel.config
                ) {
                    HStack {
                        Image(
                            systemName: "speaker.wave.3.fill",
                            variableValue: viewModel.normalizedValue
                        )
                        
                        Spacer(minLength: 0)
                        
                        Text(viewModel.formattedValue)
                            .font(.callout)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(15)
            .navigationTitle("Expandable Slider")
        }
    }
}

#Preview {
    ContentView()
}
