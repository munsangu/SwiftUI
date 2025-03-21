import SwiftUI

struct ParticlesView: View {
    var particles: [SnapParticle]
    var animateEffect: Bool
    var isReintegrating: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(particles) { particle in
                Image(uiImage: particle.particleImage)
                    .offset(particle.particleOffset)
                    .offset(calculateOffset(for: particle))
                    .opacity(calculateOpacity())
            }
        }
        .compositingGroup()
        .blur(radius: animateEffect ? 5 : 0)
    }
    
    private func calculateOffset(for particle: SnapParticle) -> CGSize {
        if isReintegrating {
            return CGSize(
                width: animateEffect ? particle.initialRandomOffset?.width ?? CGFloat.random(in: -100...100) : 0,
                height: animateEffect ? particle.initialRandomOffset?.height ?? CGFloat.random(in: -100...100) : 0
            )
        } else {
            return CGSize(
                width: animateEffect ? CGFloat.random(in: -60...(-10)) : 0,
                height: animateEffect ? CGFloat.random(in: -100...(-10)) : 0
            )
        }
    }
    
    private func calculateOpacity() -> CGFloat {
        if isReintegrating {
            return animateEffect ? 0.3 : 1
        } else {
            return animateEffect ? 0 : 1
        }
    }
}
