import SwiftUI

struct DummyContent: View {
    var body: some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(),
                count: 2
            )) {
                ForEach(
                    1...50,
                    id: \.self
                ) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.gray.opacity(0.2))
                        .frame(height: 160)
                }
            }
    }
}

#Preview {
    DummyContent()
}
