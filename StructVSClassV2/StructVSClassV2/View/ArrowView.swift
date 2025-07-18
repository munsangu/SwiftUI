import SwiftUI

struct ArrowView: View {
    @State private var arrowOffset: CGFloat = -100

    var body: some View {
        Image(systemName: "arrow.right")
            .font(.system(size: 40))
            .offset(x: arrowOffset)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.0)) {
                    arrowOffset = 0
                }
            }
    }
}
