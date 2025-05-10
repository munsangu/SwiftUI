import SwiftUI

struct FloatingWindow: View {
    @State private var isHovering: Bool = false
    @Environment(\.dismissWindow) private var dismissWindow
    var body: some View {
        Image(.ironman)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: 200,
                height: 200
            )
            .overlay {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay {
                        Button {
                            dismissWindow()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                    .opacity(isHovering ? 1 : 0)
                    .animation(
                        .snappy,
                        value: isHovering
                    )
            }
            .onHover {
                isHovering = $0
            }
            .clipShape(.rect(cornerRadius: 30))
    }
}

#Preview {
    FloatingWindow()
}

