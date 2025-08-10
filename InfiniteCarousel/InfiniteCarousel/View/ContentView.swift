import SwiftUI

struct ContentView: View {
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .yellow,
        .purple
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .indigo,
                            .black
                    ]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                Text("Infinite Carousel")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Spacer()
                
                InfiniteCarouselView(
                    data: colors,
                    id: \.self,
                    spacing: 5,
                    repeatCount: 20
                ) { color in
                    RoundedRectangle(cornerRadius: 18)
                        .fill(color)
                        .shadow(
                            color: .white.opacity(0.3),
                            radius: 8,
                            x: 0,
                            y: 4
                        )
                        .overlay {
                            Text(color.description.capitalized)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
