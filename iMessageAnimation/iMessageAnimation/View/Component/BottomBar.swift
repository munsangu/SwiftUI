import SwiftUI

struct BottomBar: View {
    @Binding var config: MenuConfig
    var body: some View {
        HStack(spacing: 12) {
            MenuSourceButton(config: $config) {
                Image(systemName: "plus")
                    .font(.title3)
                    .frame(
                        width: 35,
                        height: 35
                    )
                    .background {
                        Circle()
                            .fill(.gray.opacity(0.25))
                            .background(
                                .background,
                                in: .circle
                            )
                    }
            } onTap: {
                print("Tapped!")
            }
            
            TextField(
                "Text Message",
                text: .constant("")
            )
                .padding(
                    .vertical,
                    8
                )
                .padding(
                    .horizontal,
                    15
                )
                .background {
                    Capsule()
                        .stroke(
                            .gray.opacity(0.3),
                            lineWidth: 1.5
                        )
                }
        }
        .padding(
            .horizontal,
            15
        )
        .padding(
            .bottom,
            10
        )
    }
}
