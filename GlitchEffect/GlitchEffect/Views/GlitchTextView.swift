import SwiftUI

struct GlitchTextView: View {
    let text: String
    let trigger: Bool
    
    init(
        _ text: String,
        trigger: Bool
    ) {
        self.text = text
        self.trigger = trigger
    }
    
    var body: some View {
        ZStack {
            GlitchText(
                text: text,
                trigger: trigger
            ) {
                LinearKeyframe(
                    GlitchFrame(
                        top: -5,
                        center: 0,
                        bottom: 0,
                        shadowOpacity: 0.2),
                    duration: 0.1
                )
                LinearKeyframe(
                    GlitchFrame(
                        top: -5,
                        center: -5,
                        bottom: -5,
                        shadowOpacity: 0.6),
                    duration: 0.1
                )
                LinearKeyframe(
                    GlitchFrame(
                        top: -5,
                        center: -5,
                        bottom: 5,
                        shadowOpacity: 0.8),
                    duration: 0.1
                )
                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 5,
                        bottom: 5,
                        shadowOpacity: 0.4),
                    duration: 0.1)
                
                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 0,
                        bottom: 5,
                        shadowOpacity: 0.1),
                    duration: 0.1)
                
                LinearKeyframe(
                    GlitchFrame(), duration: 0.1)
            }
            
            GlitchText(
                text: text,
                trigger: trigger,
                shadow: .green
            ) {
                LinearKeyframe(
                    GlitchFrame(
                        top: 0,
                        center: 5,
                        bottom: 0,
                        shadowOpacity: 0.2),
                    duration: 0.1)
                
                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 5,
                        bottom: 5,
                        shadowOpacity: 0.3),
                    duration: 0.1)
                
                LinearKeyframe(
                    GlitchFrame(
                        top: 5,
                        center: 5,
                        bottom: -5,
                        shadowOpacity: 0.5),
                    duration: 0.1
                )
                LinearKeyframe(
                    GlitchFrame(
                        top: 0,
                        center: 5,
                        bottom: -5,
                        shadowOpacity: 0.6),
                    duration: 0.1
                )
                LinearKeyframe(
                    GlitchFrame(
                        top: 0,
                        center: -5,
                        bottom: 0,
                        shadowOpacity: 0.3),
                    duration: 0.1
                )
                LinearKeyframe(
                    GlitchFrame(),
                    duration: 0.1
                )
            }
        }
    }
}
