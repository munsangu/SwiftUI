import SwiftUI

struct ContentView: View {
    @State private var age: Int = 25
    @State private var weight: Int = 50
    @State private var height: Int = 50
    @State private var experience: Int = 30
    @State private var iq: Int = 100
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.black,
                    Color.black.opacity(0.6)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40)  {
                Spacer()
                
                CustomProgressBar(
                    sliderValue: $age,
                    emoji: "🎂",
                    title: "Age",
                    gradient: Gradient(
                        colors: [
                            Color.blue,
                            Color.purple
                        ]
                    ),
                    trackColor: Color.gray.opacity(0.3),
                    thumbColor: Color.blue,
                    tickColor: Color.white
                )
                
                CustomProgressBar(
                    sliderValue: $weight,
                    emoji: "⚖️",
                    title: "Weight",
                    gradient: Gradient(
                        colors: [
                            Color.green,
                            Color.yellow
                        ]
                    ),
                    trackColor: Color.gray.opacity(0.3),
                    thumbColor: Color.green,
                    tickColor: Color.white
                )
                
                CustomProgressBar(
                    sliderValue: $height,
                    emoji: "📏",
                    title: "Height",
                    gradient: Gradient(
                        colors: [
                            Color.orange,
                            Color.red
                        ]
                    ),
                    trackColor: Color.gray.opacity(0.3),
                    thumbColor: Color.orange,
                    tickColor: Color.white
                )
                
                CustomProgressBar(
                    sliderValue: $experience,
                    emoji: "💼",
                    title: "Experience",
                    gradient: Gradient(
                        colors: [
                            Color.pink,
                            Color.purple
                        ]
                    ),
                    trackColor: Color.gray.opacity(0.3),
                    thumbColor: Color.pink,
                    tickColor: Color.white
                )
                
                CustomProgressBar(
                    sliderValue: $iq,
                    emoji: "🧠",
                    title: "IQ",
                    gradient: Gradient(
                        colors: [
                            Color.teal,
                            Color.blue
                        ]
                    ),
                    trackColor: Color.gray.opacity(0.3),
                    thumbColor: Color.teal,
                    tickColor: Color.white
                )
                
                Spacer()
            }
            .padding(
                .horizontal,
                30
            )
        }
    }
}

#Preview {
    ContentView()
}
