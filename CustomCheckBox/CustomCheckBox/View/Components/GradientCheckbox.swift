import SwiftUI

struct GradientCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            Button {
                withAnimation(
                    .easeInOut
                ) {
                    isChecked.toggle()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            isChecked ? Color.clear : Color.gray,
                            lineWidth: 2
                        )
                        .frame(
                            width: 25,
                            height: 25
                        )
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    isChecked
                                    ? LinearGradient(
                                        colors: [Color.blue, Color.purple],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                    : LinearGradient(
                                        colors: [Color.clear, Color.clear],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                    
                    if isChecked {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(
                                .system(
                                    size: 14,
                                    weight: .bold
                                )
                            )
                            .transition(.scale)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Gradient Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            GradientCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
