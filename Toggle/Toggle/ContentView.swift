import SwiftUI

struct ContentView: View {
    @State private var isWiFiOn = false
    var body: some View {
        Form {
            Toggle(
                "Wi-Fi",
                isOn: $isWiFiOn
            )
            .tint(.red)
            
            Toggle (
                "Wi-Fi",
                systemImage: "wifi",
                isOn: $isWiFiOn
            )
            .tint(.yellow)
            
            Toggle (
                "Wi-Fi",
                systemImage: "wifi",
                isOn: $isWiFiOn
            )
            .toggleStyle(.button)
            
            Toggle (
                "Wi-Fi",
                systemImage: isWiFiOn ? "wifi" : "wifi.slash",
                isOn: $isWiFiOn
            )
            .font(.largeTitle)
            .toggleStyle(.button)
            .labelStyle(.iconOnly)
            .contentTransition(.symbolEffect)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
