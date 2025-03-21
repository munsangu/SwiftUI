import SwiftUI

extension View {
    @ViewBuilder
    func disintegrationEffect(
        isDeleted: Bool,
        isReintegrating: Bool = false,
        isVisible: Bool = true,
        completion: @escaping () -> ()
    ) -> some View {
        self
            .modifier(
                DisintegrationEffectModifier(
                    isDeleted: isDeleted,
                    isReintegrating: isReintegrating,
                    isVisible: isVisible,
                    completion: completion
                )
            )
    }
}

struct DisintegrationEffectModifier: ViewModifier {
    var isDeleted: Bool
    var isReintegrating: Bool
    @State private var isVisible: Bool
    var completion: () -> ()
    
    @State private var particles: [SnapParticle] = []
    @State private var animateEffect: Bool = false
    @State private var triggerSnapshot: Bool = false
    @State private var snapshotImage: UIImage? = nil
    
    private let imageProcessor = ImageProcessor()
    
    init(
        isDeleted: Bool,
        isReintegrating: Bool,
        isVisible: Bool,
        completion: @escaping () -> ()
    ) {
        self.isDeleted = isDeleted
        self.isReintegrating = isReintegrating
        _isVisible = State(initialValue: isVisible)
        self.completion = completion
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(
                particles.isEmpty || isReintegrating ?
                isVisible ? 1 : 0 :
                0
            )
            .overlay(alignment: .topLeading) {
                ParticlesView(
                    particles: particles,
                    animateEffect: animateEffect,
                    isReintegrating: isReintegrating
                )
            }
            .snapshot(trigger: triggerSnapshot) { snapshot in
                Task {
                    try? await Task.sleep(for: .seconds(0.2))
                    Task.detached(priority: .high) {
                        await createParticles(snapshot)
                    }
                }
            }
            .onChange(of: isDeleted) { _, newValue in
                if newValue && particles.isEmpty {
                    triggerSnapshot = true
                }
            }
            .onChange(of: isReintegrating) { _, newValue in
                if newValue {
                    if particles.isEmpty && snapshotImage != nil {
                        Task.detached(priority: .high) {
                            await createParticles(snapshotImage!)
                        }
                    } else if particles.isEmpty {
                        triggerSnapshot = true
                    } else {
                        startReintegrationAnimation()
                    }
                }
            }
    }
    
    private func startReintegrationAnimation() {
        withAnimation(.easeInOut(duration: 0.1)) {
            isVisible = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(
                .easeInOut(duration: 1.5),
                completionCriteria: .logicallyComplete
            ) {
                animateEffect = false
            } completion: {
                withAnimation(.easeIn(duration: 0.3)) {
                    isVisible = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    particles = []
                    completion()
                }
            }
        }
    }

    private func createParticles(_ snapshot: UIImage) async {
        await MainActor.run {
            snapshotImage = snapshot
        }

        let newParticles = await imageProcessor.generateParticles(
            from: snapshot,
            isReintegrating: isReintegrating
        )

        await MainActor.run {
            self.particles = newParticles

            if isReintegrating {
                isVisible = false
                animateEffect = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    startReintegrationAnimation()
                }
            } else {
                withAnimation(
                    .easeInOut(duration: 1.5),
                    completionCriteria: .logicallyComplete
                ) {
                    animateEffect = true
                } completion: {
                    completion()
                }
            }
        }
    }
}
