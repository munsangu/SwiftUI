import SwiftUI

struct NoteCardView: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 5
        ) {
            GeometryReader { geometry in
                Image(.cafe)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .clipped()
            }
            .frame(height: Constants.DummyContent.imageHeight)
            
            VStack(
                alignment: .leading,
                spacing: 12
            ) {
                Text("Cafe On A Rainy Day")
                    .font(.title.bold())
            }
            .padding(Constants.padding)
        }
    }
}

#Preview {
    NoteCardView()
}
