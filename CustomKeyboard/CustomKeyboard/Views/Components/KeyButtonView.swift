import SwiftUI

struct KeyButtonView: View {
    let value: String
    let isImage: Bool
    let action: () -> Void
    let showBackground: Bool
    
    init(
        value: String,
        isImage: Bool = false,
        action: @escaping () -> Void,
        showBackground: Bool = true
    ) {
        self.value = value
        self.isImage = isImage
        self.action = action
        self.showBackground = showBackground
    }
    
    var body: some View {
        Button(action: action) {
            Group {
                if isImage {
                    Image(systemName: value)
                } else {
                    Text(value)
                }
            }
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 50, height: 50)
            .background {
                if showBackground && !isImage {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            .background
                                .shadow(
                                    .drop(
                                        color: .black.opacity(0.08),
                                        radius: 3,
                                        x: 0,
                                        y: 0
                                    )
                                )
                        )
                }
            }
            .foregroundStyle(Color.primary)
        }
    }
}

#Preview {
    VStack {
        KeyButtonView(
            value: "1",
            action: {}
        )
        KeyButtonView(
            value: "delete.backward.fill",
            isImage: true,
            action: {},
            showBackground: false
        )
    }
    .padding()
}
