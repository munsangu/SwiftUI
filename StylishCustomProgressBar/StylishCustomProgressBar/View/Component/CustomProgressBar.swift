import SwiftUI

struct CustomProgressBar: View {
    @Binding var sliderValue: Int
    let emoji: String
    let title: String
    let gradient: Gradient
    let trackColor: Color
    let thumbColor: Color
    let tickColor: Color
    private let minValue = 0
    private let maxValue = 100
    private let numberOfTicks = 11
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(
                        .system(
                            size: 18,
                            weight: .medium
                        )
                    )
                
                Text(": \(sliderValue)")
                    .foregroundColor(.white)
                    .font(
                        .system(
                            size: 18,
                            weight: .medium
                        )
                    )
                
                Spacer()
            }
            
            ZStack {
                Rectangle()
                    .fill(trackColor)
                    .frame(height: 10)
                    .cornerRadius(4)
                
                HStack {
                    Rectangle()
                        .fill(
                            LinearGradient(
                            gradient: gradient,
                            startPoint: .leading,
                            endPoint: .trailing
                            )
                        )
                        .frame(
                            width: CGFloat(sliderValue) / CGFloat(maxValue) * 280,
                            height: 8
                        )
                        .cornerRadius(4)
                    
                    Spacer()
                }
                
                HStack {
                    ForEach(
                        0..<numberOfTicks,
                        id: \.self
                    ) { index in
                        Circle()
                            .fill(tickColor)
                            .frame(
                                width: 4,
                                height: 4
                            )
                        
                        if index < numberOfTicks - 1 {
                            Spacer()
                        }
                    }
                }
                .padding(
                    .horizontal,
                    2
                )
                
                HStack {
                    Spacer()
                        .frame(width: CGFloat(sliderValue) / CGFloat(maxValue) * 260)
                    
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(
                                width: 28,
                                height: 28
                            )
                        
                        Text(emoji)
                            .font(.system(size: 14))
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newValue = Int((value.location.x / 280) * CGFloat(maxValue))
                                sliderValue = max(minValue, min(maxValue, newValue))
                            }
                    )
                    
                    Spacer()
                }
            }
            .frame(height: 28)
        }
    }
}

#Preview {
    CustomProgressBar(
        sliderValue: .constant(65),
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
    .padding()
    .background(Color.black)
}
