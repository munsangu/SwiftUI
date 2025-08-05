import SwiftUI

struct ContentView: View {
    @State private var particles: [Particle] = []
    @State private var exploded: Bool = false
    @State private var activeScales: [UUID : Bool] = [:]
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ForEach(
                particles.indices,
                id: \.self
            ) { index in
                let particle = particles[index]
                
                Circle()
                    .fill(particle.color)
                    .frame(
                        width: 30,
                        height: 30
                    )
                    .offset(
                        x: exploded ? cos(particle.angle) * particle.distance : 0 ,
                        y: exploded ? sin(particle.angle) * particle.distance : 0
                    )
                    .opacity(exploded ? 1 : 0)
                    .animation(
                        .easeOut(duration: 0.6),
                        value: activeScales[particle.id]
                    )
            }
        }
        .onAppear {
            generateParticles()
            
            startFireworks()
        }
    }
    
    private func generateParticles() {
        let newParticles = (0..<10).map { _ in
            Particle(
                angle: Double.random(in: 0..<5 * .pi),
                distance: CGFloat.random(in: 30...200),
                color: Color(
                    hue: Double.random(in: 0...1),
                    saturation: 1,
                    brightness: 1,
                    opacity: 1
                )
            )
        }
        
        particles = newParticles
        activeScales = Dictionary(uniqueKeysWithValues: newParticles.map { ($0.id, false) })
    }
    
    private func animateScaleSequentially() {
        for (index, particle) in particles.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                activeScales[particle.id] = true
            }
        }
    }
    
    private func startFireworks() {
        func runCycle() {
            exploded = false
            activeScales = Dictionary(uniqueKeysWithValues: particles.map { ($0.id, false)})

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                generateParticles()
                exploded = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    exploded = false
                }
            }
        }

        runCycle()

        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            runCycle()
        }
    }
}


#Preview {
    ContentView()
}
