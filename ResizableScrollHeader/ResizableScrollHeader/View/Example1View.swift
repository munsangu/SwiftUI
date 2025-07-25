import SwiftUI

struct Example1View: View {
    @State var isSticky: Bool = false
    var body: some View {
        ResizableHeaderScrollView(
            minimumHeight: 100,
            maximumHeight: 250,
            ignoreSafeAreaTop: false,
            isSticky: isSticky
        ) { progress, safeArea in
                RoundedRectangle(cornerRadius: 30)
                    .fill(.indigo.gradient)
                    .overlay {
                        Text("\(progress)")
                            .foregroundStyle(.white)
                    }
                    .padding(
                        .horizontal,
                        15
                    )
                    .padding(
                        .top,
                        10
                    )
        } content: {
            VStack(spacing: 12) {
                Toggle(
                    "Sticky Header",
                    isOn: $isSticky
                )
                .padding(15)
                .background(
                    .gray.opacity(0.2),
                    in: .rect(cornerRadius: 15)
                )
                
                DummyContent()
            }
            .padding(15)
        }
    }
}

#Preview {
    Example1View()
}
