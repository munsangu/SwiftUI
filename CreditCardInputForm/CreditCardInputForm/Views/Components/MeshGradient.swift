import SwiftUI

struct MeshGradient: View {
    var width: Int
    var height: Int
    var points: [UnitPoint]
    var colors: [Color]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                LinearGradient(
                    colors: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
    }
}
