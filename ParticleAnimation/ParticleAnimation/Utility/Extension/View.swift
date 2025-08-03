import SwiftUI

extension View {
    func multipleObjectAnimation(
        howManyObjectValue: Int,
        width: CGFloat = 10,
        height: CGFloat = 10,
        color: Color = .white,
        offsetX: CGFloat = 0,
        offsetY: CGFloat = 0,
        scaleVB: Bool = false,
        durationAnimation: CGFloat = 2.0
    ) -> some View {
        var col: Color = color
        
        return ZStack {
            ForEach(0..<howManyObjectValue) { _ in
                self
                    .foregroundStyle(col)
                    .frame(
                        width: width,
                        height: height
                    )
                    .offset(
                        x: offsetX * CGFloat.random(in: -10...10),
                        y: offsetY * CGFloat.random(in: -10...10)
                    )
                    .scaleEffect(scaleVB ? CGFloat.random(in: 0.7...1.1) : 1)
                    .animation(.easeInOut(duration: durationAnimation))
            }
        }
    }
}
