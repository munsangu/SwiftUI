import SwiftUI

struct ReflectionViewModifier: ViewModifier {
    let isEnabled: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isEnabled {
                    GeometryReader {
                        let size = $0.size
                        
                        content
                            .scaleEffect(y: -1)
                            .mask {
                                Rectangle()
                                    .fill(
                                        .linearGradient(
                                            colors: [
                                                .white,
                                                .white.opacity(0.7),
                                                .white.opacity(0.5),
                                                .white.opacity(0.3),
                                                .white.opacity(0.1),
                                                .white.opacity(0),
                                            ] + Array(
                                                repeating: Color.clear,
                                                count: 5)
                                            ,
                                            startPoint: .top,
                                            endPoint: .bottom)
                                    )
                            }
                            .offset(y: size.height + 5)
                            .opacity(0.5)
                    }
                }
            }
    }
}

extension View {
    @ViewBuilder
    func reflection(_ added: Bool) -> some View {
        modifier(ReflectionViewModifier(isEnabled: added))
    }
}
