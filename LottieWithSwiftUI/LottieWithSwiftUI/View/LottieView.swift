import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        return animationView
    }
    
    func updateUIView(
        _ uiView: LottieAnimationView,
        context: Context
    ) {
        uiView.animation = LottieAnimation.named(animationName)
        uiView.play()
    }
}
