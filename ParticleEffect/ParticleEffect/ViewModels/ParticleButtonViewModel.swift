import SwiftUI

class ParticleButtonViewModel: ObservableObject {
    @Published var isActive: Bool = false
    @Published var particles: [Particle] = []
    
    let systemImage: String
    let activeTint: Color
    let inActiveTint: Color
    
    init(systemImage: String, activeTint: Color, inActiveTint: Color) {
        self.systemImage = systemImage
        self.activeTint = activeTint
        self.inActiveTint = inActiveTint
        initializeParticles()
    }
    
    private func initializeParticles() {
        if particles.isEmpty {
            for _ in 1...15 {
                let particle = Particle()
                particles.append(particle)
            }
        }
    }
    
    func toggleStatus() {
        isActive.toggle()
        updateParticles()
    }
    
    private func updateParticles() {
        if !isActive {
            resetParticles()
        } else {
            animateParticles()
        }
    }
    
    private func resetParticles() {
        for index in particles.indices {
            particles[index].reset()
        }
    }
    
    private func animateParticles() {
        for index in particles.indices {
            let total: CGFloat = CGFloat(particles.count)
            let progress: CGFloat = CGFloat(index) / total
            
            let maxX: CGFloat = (progress > 0.5) ? 100 : -100
            let maxY: CGFloat = 60
            
            let randomX: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxX)
            let randomY: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxY) + 35
            let randomScale: CGFloat = .random(in: 0.35...1)
            
            withAnimation(
                .interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.7,
                    blendDuration: 0.7
                )
            ) {
                let extraRandomX: CGFloat = (progress < 0.5 ? .random(in: 0...10) : .random(in: -10...0))
                let extraRandomY: CGFloat = .random(in: 0...30)
                
                particles[index].randomX = randomX + extraRandomX
                particles[index].randomY = -randomY - extraRandomY
            }
            
            withAnimation(.easeInOut(duration: 0.3)) {
                particles[index].scale = randomScale
            }
            
            withAnimation(
                .interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.7,
                    blendDuration: 0.7
                ).delay(0.25 + (Double(index) * 0.005))
            ) {
                particles[index].scale = 0.001
            }
        }
    }
    
    func currentColor() -> Color {
        return isActive ? activeTint : inActiveTint
    }
    
    func backgroundStyle() -> Color {
        return isActive ? activeTint.opacity(0.25) : Color("ButtonColor")
    }
}
