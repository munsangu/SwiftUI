import SwiftUI

struct ContentView: View {
    @State private var selectedValue: Int = 50
    var body: some View {
        NavigationStack {
            VStack {
                Text("Selected Value: \(selectedValue)")
                    .onTapGesture {
                        selectedValue = 39
                    }
                
                Spacer(minLength: 0)
                
                WheelPickerView(
                    range: 5...100,
                    selectedValue: $selectedValue
                ) { currentValue in
                    Text(String(currentValue))
                        .font(.title)
                        .fontWeight(.semibold)
                        .contentTransition(.numericText())
                        .animation(
                            .snappy,
                            value: currentValue
                        )
                }
            }
            .padding(15)
            .navigationTitle("Wheel Picker")
        }
    }
}

#Preview {
    ContentView()
}
