import SwiftUI

struct PacMan: View {
    @State private var isMouthOpen = false
    @State private var animateMovement = false
    @State private var timeToStartMovement = 0.1
    @State private var speedOfPacman = 0.05
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    path.addArc(
                        center:
                            CGPoint(
                                x: geometry.size.width / 2,
                                y: geometry.size.height / 2
                            ),
                        radius: geometry.size.width / 4,
                        startAngle: .degrees(isMouthOpen ? -30 : -1),
                        endAngle: .degrees(isMouthOpen ? 30 : 1),
                        clockwise: true)
                    
                    path.addLine(
                        to:
                            CGPoint(
                                x: geometry.size.width / 2,
                                y: geometry.size.height / 2
                            )
                    )
                    
                }
                .fill(Color.yellow)
                .animation(
                    .spring().speed(speedOfPacman),
                    value: animateMovement
                )
                .offset(
                    x: animateMovement ? 250 : -250,
                    y: 0
                )
            }
            .onAppear {
                Timer.scheduledTimer(
                    withTimeInterval: 0.3,
                    repeats: true
                ) { timer in
                    isMouthOpen.toggle()
                }
                Timer.scheduledTimer(
                    withTimeInterval: timeToStartMovement,
                    repeats: false
                ) { timer in
                    animateMovement.toggle()
                }
            }
        }
    }
}
