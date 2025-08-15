import SwiftUI
import Combine

struct AnimatedCharView: View {
    let char: String
    let index: Int
    let width: CGFloat
    let height: CGFloat
    let centerY: CGFloat
    let totalCount: Int
    let show: Bool
    let show1: Bool
    let color: Color
    let namespace: Namespace.ID
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let colors: [Color]
    @Binding var currentColor: Color
    
    var body: some View {
        let letterSpacing: CGFloat = 10
        let totalWidth = CGFloat(totalCount - 1) * letterSpacing
        
        let posX: CGFloat = show
            ? (width / 2 - totalWidth / 2) + CGFloat(index) * letterSpacing
            : CGFloat.random(in: 0...width)
        
        let posY: CGFloat = show
            ? centerY
            : CGFloat.random(in: 0...height)
        
        let offsetX: CGFloat = !show ? 80 : 0
        let offsetY: CGFloat = !show ? CGFloat(80 * index) : 0
        
        Text(char)
            .font(.system(size: 50))
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .colorMultiply(show1 ? color : .white)
            .shadow(
                color: .orange,
                radius: 3,
                x: 3,
                y: 3
            )
            .position(
                x: posX / 8,
                y: posY
            )
            .offset(
                x: offsetX,
                y: offsetY
            )
            .matchedGeometryEffect(id: "animation\(index)", in: namespace)
            .onReceive(timer) { _ in
                withAnimation(.easeInOut(duration: 2)) {
                    currentColor = colors.randomElement() ?? .white
                }
            }
    }
}
