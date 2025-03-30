import SwiftUI
import Combine

class IntroViewModel: ObservableObject {
    @Published private(set) var intros: [Intro] = []
    @Published var activeIntro: Intro?
    
    private var animationCancellable: AnyCancellable?
    
    init() {
        setupIntros()
    }
    
    private func setupIntros() {
        intros = [
            .init(text: "Let's Create",
                  textColor: .color4,
                  circleColor: .color4,
                  bgColor: .color1
                 ),
            .init(text: "Let's Brain Strom",
                  textColor: .color1,
                  circleColor: .color1,
                  bgColor: .color2
                 ),
            .init(text: "Let's Explore",
                  textColor: .color2,
                  circleColor: .color2,
                  bgColor: .color3
                 ),
            .init(text: "Let's Invent",
                  textColor: .color3,
                  circleColor: .color3,
                  bgColor: .color4
                 ),
            .init(text: "Let's Create",
                  textColor: .color4,
                  circleColor: .color4,
                  bgColor: .color1
                 ),
        ]
    }
    
    func startAnimation() {
        guard !intros.isEmpty else { return }
        
        activeIntro = Intro(
            text: intros.first!.text,
            textColor: intros.first!.textColor,
            circleColor: intros.first!.circleColor,
            bgColor: intros.first!.bgColor
        )
        
        Task {
            try? await Task.sleep(nanoseconds: UInt64(1_000_000_000 * 0.5))
            
            await MainActor.run {
                animate(index: 0)
            }
        }
    }
    
    func stopAnimation() {
        animationCancellable?.cancel()
        animationCancellable = nil
    }
    
    func textSize(_ text: String) -> CGFloat {
        return NSString(string: text)
            .size(
                withAttributes: [
                    .font: UIFont.preferredFont(
                        forTextStyle: .largeTitle
                    )
                ]
            ).width
    }
    
    func animate(
        index: Int,
        loop: Bool = true
    ) {
        guard activeIntro != nil else { return }
        
        if intros.indices.contains(index + 1) {
            var updatedIntro = activeIntro!
            updatedIntro.text = intros[index].text
            updatedIntro.textColor = intros[index].textColor
            
            self.activeIntro = updatedIntro
            
            DispatchQueue.main.async {
                withAnimation(
                    .snappy(duration: 1),
                    completionCriteria: .removed
                ) {
                    self.activeIntro?.textOffset = -(self.textSize(self.intros[index].text) + 20)
                    self.activeIntro?.circleOffset = -(self.textSize(self.intros[index].text) + 20) / 2
                } completion: { [weak self] in
                    guard let self = self else { return }
                    
                    withAnimation(
                        .snappy(duration: 0.8),
                        completionCriteria: .logicallyComplete
                    ) {
                        self.activeIntro?.textOffset = 0
                        self.activeIntro?.circleOffset = 0
                        self.activeIntro?.circleColor = self.intros[index + 1].circleColor
                        self.activeIntro?.bgColor = self.intros[index + 1].bgColor
                    } completion: { [weak self] in
                        self?.animate(index: index + 1, loop: loop)
                    }
                }
            }
        } else if loop {
            animate(index: 0, loop: loop)
        } else {
            if loop {
                animate(index: 0, loop: loop)
            }
        }
    }
}
