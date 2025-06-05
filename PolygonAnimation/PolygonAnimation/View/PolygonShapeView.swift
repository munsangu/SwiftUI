import SwiftUI

struct PolygonShapeView: View {
    let sides: Int
    let lineWidth: CGFloat
    let gradientColors: [Color]
    let shadowRadius: CGFloat
    let animationDuration: Double
    
    private func vertices(for sides: Int, in rect: CGRect) -> [CGPoint] {
        guard sides >= 3 else { return [] }
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2 * 0.8
        let angleStep = 2 * Double.pi / Double(sides)
        
        return (0..<sides).map { index in
            let angle = angleStep * Double(index) - Double.pi / 2
            return CGPoint(
                x: center.x + CGFloat(cos(angle)) * radius,
                y: center.y + CGFloat(sin(angle)) * radius
            )
        }
    }
    
    private func polygonPath(vertices: [CGPoint]) -> Path {
        var path = Path()
        
        guard !vertices.isEmpty else { return path }
        
        path.move(to: vertices[0])
        for vertex in vertices.dropFirst() {
            path.addLine(to: vertex)
        }
        path.closeSubpath()
        
        return path
    }
    
    private func internalLinesPath(vertices: [CGPoint]) -> Path {
        var path = Path()
        
        guard vertices.count > 4 else { return path }
        
        for (i, startVertex) in vertices.enumerated() {
            for (j, endVertex) in vertices.enumerated() {
                if i < j && j - i > 1 && !(i == 0 && j == vertices.count - 1) {
                    path.move(to: startVertex)
                    path.addLine(to: endVertex)
                }
            }
        }
        
        return path
    }
    
    init(sides: Int) {
        self.sides = max(3, sides)
        self.lineWidth = 2.0
        self.gradientColors = [.pink, .purple, .blue]
        self.shadowRadius = 8.0
        self.animationDuration = 0.8
    }
    
    init(
        sides: Int,
        lineWidth: CGFloat = 2.0,
        gradientColors: [Color] = [.pink, .purple, .blue],
        shadowRadius: CGFloat = 8.0,
        animationDuration: Double = 0.8
    ) {
        self.sides = max(3, sides)
        self.lineWidth = lineWidth
        self.gradientColors = gradientColors
        self.shadowRadius = shadowRadius
        self.animationDuration = animationDuration
    }
    
    var body: some View {
        GeometryReader { geometry in
            let vertices = vertices(for: sides, in: geometry.frame(in: .local))
            let polygonPath = polygonPath(vertices: vertices)
            let internalPath = internalLinesPath(vertices: vertices)
            
            ZStack {
                if sides > 4 {
                    internalPath
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: gradientColors.map { $0.opacity(0.4) }),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(
                                lineWidth: lineWidth * 0.6,
                                lineCap: .round,
                                lineJoin: .round
                            )
                        )
                        .blur(radius: 0.5)
                }
                
                polygonPath
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: gradientColors),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(
                            lineWidth: lineWidth,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .shadow(
                        color: gradientColors.first?.opacity(0.5) ?? .pink.opacity(0.5),
                        radius: shadowRadius,
                        x: 0,
                        y: 0
                    )
                
                polygonPath
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: gradientColors.map { $0.opacity(0.3) }),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(
                            lineWidth: lineWidth * 3,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .blur(radius: shadowRadius / 2)
                
                ForEach(Array(vertices.enumerated()), id: \.offset) { index, vertex in
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [
                                    gradientColors[index % gradientColors.count],
                                    gradientColors[index % gradientColors.count].opacity(0.3)
                                ]),
                                center: .center,
                                startRadius: 0,
                                endRadius: 4
                            )
                        )
                        .frame(width: 6, height: 6)
                        .position(vertex)
                        .shadow(
                            color: gradientColors[index % gradientColors.count].opacity(0.8),
                            radius: 4,
                            x: 0,
                            y: 0
                        )
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .animation(.easeInOut(duration: animationDuration), value: sides)
    }
}

#Preview("Polygon Shape Variations") {
    VStack(spacing: 30) {
        HStack(spacing: 20) {
            PolygonShapeView(sides: 3)
                .frame(width: 150, height: 150)
            
            PolygonShapeView(sides: 4)
                .frame(width: 150, height: 150)
        }
        
        HStack(spacing: 20) {
            PolygonShapeView(sides: 6)
                .frame(width: 150, height: 150)
            
            PolygonShapeView(sides: 8)
                .frame(width: 150, height: 150)
        }
    }
    .padding()
    .background(Color.black)
}
