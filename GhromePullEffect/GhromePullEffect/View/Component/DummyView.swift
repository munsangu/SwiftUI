import SwiftUI

struct DummyView: View {
    var body: some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(),
                count: 2
            )
        ) {
            ForEach(
                1...50,
                id: \.self
            ) { _ in
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red.gradient)
                    .frame(height: 160)
                    .overlay(alignment: .topLeading) {
                        VStack(
                            alignment: .leading,
                            spacing: 6
                        ) {
                            Circle()
                                .fill(.bar)
                                .frame(
                                    width: 45,
                                    height: 45
                                )
                                .padding(
                                    .bottom,
                                    5
                                )
                            
                            Capsule()
                                .fill(.bar)
                                .frame(
                                    width: 100,
                                    height: 5
                                )
                            
                            Capsule()
                                .fill(.bar)
                                .frame(
                                    width: 80,
                                    height: 5
                                )
                            
                            Capsule()
                                .fill(.bar)
                                .frame(
                                    width: 40,
                                    height: 5
                                )
                        }
                        .padding(15)
                    }
            }
        }
        .padding(15)
    }
}

#Preview {
    DummyView()
}
