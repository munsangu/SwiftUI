import SwiftUI

struct NextView: View {
    var body: some View {
        VStack {
            Text("NextView")
                .font(.largeTitle).bold()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color.white)
    }
}

#Preview {
    NextView()
}
