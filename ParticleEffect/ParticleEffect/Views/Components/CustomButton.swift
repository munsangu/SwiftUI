import SwiftUI

struct CustomButton: View {
    @ObservedObject var viewModel: ParticleButtonViewModel
    let action: () -> Void
    let font: Font
    
    init(systemImage: String,
         activeTint: Color,
         inActiveTint: Color,
         font: Font = .title2,
         action: @escaping () -> Void) {
        self.viewModel = ParticleButtonViewModel(
            systemImage: systemImage,
            activeTint: activeTint,
            inActiveTint: inActiveTint
        )
        self.font = font
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            viewModel.toggleStatus()
            action()
        }) {
            Image(systemName: viewModel.systemImage)
                .font(font)
                .overlay(
                    ParticleView(viewModel: viewModel)
                )
                .foregroundStyle(viewModel.currentColor())
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background {
                    Capsule()
                        .fill(viewModel.backgroundStyle())
                }
        }
    }
}

struct ParticleView: View {
    @ObservedObject var viewModel: ParticleButtonViewModel
    
    var body: some View {
        ZStack {
            ForEach(viewModel.particles) { particle in
                Image(systemName: viewModel.systemImage)
                    .foregroundStyle(viewModel.currentColor())
                    .scaleEffect(particle.scale)
                    .offset(
                        x: particle.randomX,
                        y: particle.randomY
                    )
                    .opacity(particle.opacity)
                    .opacity(viewModel.isActive ? 1 : 0)
                    .animation(
                        .none,
                        value: viewModel.isActive
                    )
            }
        }
    }
}
