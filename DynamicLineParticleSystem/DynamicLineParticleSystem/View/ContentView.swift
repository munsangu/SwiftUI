import SwiftUI

struct ContentView: View {
    @State private var particles: [Particle] = []
    private let particleCount = 150
    private let connectionDistance: CGFloat = 100
    private let timer = Timer.publish(
        every: 1/60,
        on: .main,
        in: .common
    )
        .autoconnect()
    var body: some View {
        GeometryReader { geometry in
            Canvas { context, size in
                for i in 0..<particles.count {
                    for j in (i + 1)..<particles.count {
                        let dx = particles[i].position.x - particles[j].position.x
                        let dy = particles[i].position.y - particles[j].position.y
                        let distance = sqrt(dx * dx + dy * dy)
                        
                        if distance < connectionDistance {
                            let opacity = 1.0 - (distance / connectionDistance)
                            var connectionPath = Path()
                            connectionPath.move(to: particles[i].position)
                            connectionPath.addLine(to: particles[j].position)
                            context.stroke(
                                connectionPath,
                                with: .color(.white.opacity(opacity)),
                                lineWidth: 0.5
                            )
                        }
                    }
                }
                
                for particle in particles {
                    var particlePath = Path()
                    let halfLength = particle.length / 2
                    let dx = cos(particle.angle) * halfLength
                    let dy = sin(particle.angle) * halfLength
                    let startPoint = CGPoint(
                        x: particle.position.x - dx,
                        y: particle.position.y - dy
                    )
                    let endPoint = CGPoint(
                        x: particle.position.x + dx,
                        y: particle.position.y + dy
                    )
                    
                    particlePath.move(to: startPoint)
                    particlePath.addLine(to: endPoint)
                    
                    context.stroke(
                        particlePath,
                        with: .color(.white),
                        lineWidth: 1
                    )
                }
            }
            .background(.black)
            .onAppear {
                particles = (0..<particleCount).map { _ in
                    Particle(
                        position: CGPoint(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height)
                        ),
                        velocity: CGVector(
                            dx: CGFloat.random(in: -1.5...1.5),
                            dy: CGFloat.random(in: -1.5...1.5)
                        ),
                        angle: Double.random(in: 0...(2 * Double.pi)),
                        length: CGFloat.random(in: 10...30)
                    )
                }
            }
            .onReceive(timer) { _ in
                for index in particles.indices {
                    particles[index].position.x += particles[index].velocity.dx
                    particles[index].position.y += particles[index].velocity.dy
                    
                    if particles[index].position.x < 0 {
                        particles[index].position.x += geometry.size.width
                    } else if particles[index].position.x > geometry.size.width {
                        particles[index].position.x -= geometry.size.width
                    }
                    
                    if particles[index].position.y < 0 {
                        particles[index].position.y += geometry.size.height
                    } else if particles[index].position.y > geometry.size.height {
                        particles[index].position.y -= geometry.size.height
                    }
                    
                    particles[index].angle += 0.02
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
