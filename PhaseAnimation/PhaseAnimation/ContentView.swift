import SwiftUI

enum NotifyAnimationPhase: CaseIterable {
    case initial, lift, shakeLeft, shakeRight
    
    var yOffset: CGFloat {
        switch self {
        case .initial: 0
        case .lift, .shakeLeft, .shakeRight: -30
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .initial: 1
        case .lift, .shakeLeft, .shakeRight: 1.2
        }
    }
    
    var rotationDegress: Double {
        switch self {
        case .initial, .lift: 0
        case .shakeLeft: -30
        case .shakeRight: 30
        }
    }
}

struct ContentView: View {
    @State private var isNotified: Bool = false
    var body: some View {
        HStack(spacing: 20) {
            Button("Notify Me") {
                isNotified.toggle()
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .fontWeight(.semibold)
            .controlSize(.large)
//            .phaseAnimator([true, false]) { content, phase in
//                content
//                    .scaleEffect(phase ? 1.2 : 1.0)
//            } animation: { phase in
//                    .spring(duration: 0.3)
//            }
            
            Image(systemName: "bell")
                .resizable()
                .frame(
                    width: 44,
                    height: 44
                )
                .foregroundStyle(.pink)
                .phaseAnimator(
                    [
                        NotifyAnimationPhase.initial,
                        NotifyAnimationPhase.lift,
                        NotifyAnimationPhase.shakeLeft,
                        NotifyAnimationPhase.shakeRight,
                        NotifyAnimationPhase.shakeLeft,
                        NotifyAnimationPhase.shakeRight
                    ],
                    trigger: isNotified
                ) { content, phase in
                        content
                        .scaleEffect(phase.scale)
                        .rotationEffect(
                            .degrees(phase.rotationDegress),
                            anchor: .top
                        )
                        .offset(y: phase.yOffset)
                } animation: { phase in
                    switch phase {
                    case .initial, .lift: .spring(bounce: 0.5)
                    case .shakeLeft, .shakeRight: .easeInOut(duration: 0.15)
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
