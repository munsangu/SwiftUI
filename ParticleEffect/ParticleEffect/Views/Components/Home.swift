import SwiftUI

struct HomeView: View {
    @State private var isLinked: [Bool] = [false, false, false]
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                CustomButton(
                    systemImage: "suit.heart.fill",
                    activeTint: .pink,
                    inActiveTint: .gray) {
                        isLinked[0].toggle()
                    }
                
                CustomButton(
                    systemImage: "star.fill",
                    activeTint: .yellow,
                    inActiveTint: .gray) {
                        isLinked[1].toggle()
                    }
                
                CustomButton(
                    systemImage: "square.and.arrow.up.fill",
                    activeTint: .green,
                    inActiveTint: .gray) {
                        isLinked[2].toggle()
                    }
            }
        }
    }
}
