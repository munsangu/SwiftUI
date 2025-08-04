import SwiftUI

struct ContentView: View {
    @State private var isChecked1: Bool = false
    @State private var isChecked2: Bool = false
    @State private var isChecked3: Bool = false
    @State private var isChecked4: Bool = false
    @State private var isChecked5: Bool = false
    @State private var isChecked6: Bool = false
    @State private var isChecked7: Bool = false
    @State private var isChecked8: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                ClassicCheckbox(isChecked: $isChecked1)
               
                CircularCheckbox(isChecked: $isChecked2)
              
                RoundedCheckbox(isChecked: $isChecked3)
                
                SwitchCheckbox(isChecked: $isChecked4)
                
                HeartCheckbox(isChecked: $isChecked5)
                
                StarCheckbox(isChecked: $isChecked6)
                
                AnimatedScaleCheckbox(isChecked: $isChecked7)
                
                GradientCheckbox(isChecked: $isChecked8)
                
            }
            .navigationTitle("Custom Checkbox Designs")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
