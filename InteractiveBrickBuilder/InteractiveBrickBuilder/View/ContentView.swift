import SwiftUI

struct ContentView: View {
    @State private var brickWidth: CGFloat = 2.0
    @State private var brickHeight: CGFloat = 0.5
    @State private var brickLength: CGFloat = 2.0
    @State private var studRadius: CGFloat = 0.15
    @State private var studHeight: CGFloat = 0.1
    @State private var brickColor: Color = .red
    var body: some View {
        VStack(spacing: 0) {
            BrickView(
                brickWidth: brickWidth,
                brickHeight: brickHeight,
                brickLength: brickLength,
                studRadius: studRadius,
                studHeight: studHeight,
                brickColor: UIColor(brickColor)
            )
            .frame(height: 300)
            .background(Color.gray.opacity(0.2))
            
            Form {
                Section(header: Text("Brick Dimensions")) {
                    HStack {
                        Text("Width: \(String(format: "%.0f", brickWidth))")
                        
                        Slider(
                            value: $brickWidth,
                            in: 1...6,
                            step: 1
                        )
                    }
                    
                    HStack {
                        Text("Height: \(String(format: "%.2f", brickHeight))")
                        
                        Slider(
                            value: $brickHeight,
                            in: 0.2...2,
                            step: 0.1
                        )
                    }
                    
                    HStack {
                        Text("Length: \(String(format: "%.0f", brickLength))")
                        
                        Slider(
                            value: $brickLength,
                            in: 1...6,
                            step: 1
                        )
                    }
                }
                
                Section(header: Text("Stud Dimensions")) {
                    HStack {
                        Text("Radius: \(String(format: "%.2f", studRadius))")
                        
                        Slider(
                            value: $studRadius,
                            in: 0.1...0.5,
                            step: 0.05
                        )
                    }

                    HStack {
                        Text("Height: \(String(format: "%.2f", studHeight))")
                        
                        Slider(
                            value: $studHeight,
                            in: 0.05...0.3,
                            step: 0.05
                        )
                    }
                }
                
                Section(header: Text("Color")) {
                    ColorPicker(
                        "Brick Color",
                        selection: $brickColor
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
