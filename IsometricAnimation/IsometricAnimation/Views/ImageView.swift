import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("ironman")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: 180,
                height: 330
            )
            .clipped()
    }
}

#Preview {
    ImageView()
}
