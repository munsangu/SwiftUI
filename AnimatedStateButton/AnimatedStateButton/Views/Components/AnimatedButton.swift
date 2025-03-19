import SwiftUI

struct AnimatedButton: View {
    var config: Config
    var shape: AnyShape = .init(.capsule)
    var onTap: () async -> ()
    @State private var isLoading: Bool = false
    
    var body: some View {
        Button {
            Task {
                isLoading = true
                await onTap()
                isLoading = false
            }
        } label: {
            HStack(spacing: 10) {
                if let symbolImage = config.symbolImage {
                    Image(systemName: symbolImage)
                        .font(.title3)
                        .transition(.blurReplace)
                } else {
                    if isLoading {
                        Spinner(
                            tint: config.foregroundStyle,
                            lineWidth: 4
                        )
                        .frame(
                            width: 20,
                            height: 20
                        )
                        .transition(.blurReplace)
                    }
                }
                
                Text(config.title)
                    .contentTransition(.interpolate)
                    .fontWeight(.semibold)
            }
            .padding(
                .horizontal,
                 config.hPadding
            )
            .padding(
                .vertical,
                config.vPadding
            )
            .foregroundStyle(config.foregroundStyle)
            .background(config.background.gradient)
            .clipShape(shape)
            .contentShape(shape)
        }
        .disabled(isLoading)
        .buttonStyle(ScaleButtonStyle())
        .animation(
            config.animation,
            value: config
        )
        .animation(
            config.animation,
            value: isLoading
        )
    }
    
    struct Config: Equatable {
        var title: String
        var foregroundStyle: Color
        var background: Color
        var symbolImage: String?
        var hPadding: CGFloat = 15
        var vPadding: CGFloat = 10
        var animation: Animation = .easeInOut(duration: 0.25)
    }
}

fileprivate struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .animation(.linear(duration: 0.2)) {
                $0
                    .scaleEffect(
                        configuration.isPressed ?
                        0.9 :
                        1
                    )
            }
    }
}
