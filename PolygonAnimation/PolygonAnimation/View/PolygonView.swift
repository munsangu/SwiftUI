import SwiftUI

struct PolygonView: View {
    @State private var sides: Double = 4
    
    var body: some View {
        VStack {
            VStack {
                Text("Polygon Viewer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Adjust the slider to change the number of sides of the polygon.")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
            }
            
            Spacer(minLength: 0)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.pink.opacity(0.3), .blue.opacity(0.3)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
                    .shadow(
                        color: .pink.opacity(0.2),
                        radius: 20,
                        x: 0,
                        y: 10
                    )
                    .padding(.horizontal, 20)
                
                PolygonShapeView(sides: Int(sides))
                    .padding(60)
                    .animation(.easeInOut(duration: 1.0), value: sides)
            }
            
            Spacer(minLength: 0)
            
            VStack {
                Text("\(Int(sides)) sides 📐")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                Slider(
                    value: $sides,
                    in: 3...12,
                    step: 1
                )
                .accentColor(.pink)
                .padding(.horizontal, 40)
                .onChange(of: sides) { _, newValue in
                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                    impactFeedback.impactOccurred()
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding()
        .background {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .black, location: 0.0),
                    .init(color: .pink.opacity(0.1), location: 0.3),
                    .init(color: .blue.opacity(0.1), location: 0.7),
                    .init(color: .black, location: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PolygonView()
}
