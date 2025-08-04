import SwiftUI

struct AnimatedScaleCheckbox: View {
    @Binding var isChecked: Bool
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        HStack {
            Button {
                withAnimation(
                    .spring(
                        response: 0.3,
                        dampingFraction: 0.6
                    )
                ) {
                    isChecked.toggle()
                    animationAmount = isChecked ? 1.3 : 1.0
                }
                
                withAnimation(
                    .easeOut(duration: 0.1)
                    .delay(0.1)
                ) {
                    animationAmount = 1.0
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            isChecked ? Color.orange : Color.gray,
                            lineWidth: 2
                        )
                        .frame(
                            width: 25,
                            height: 25
                        )
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(isChecked ? Color.orange : Color.clear)
                        }
                        .scaleEffect(animationAmount)
                    
                    if isChecked {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(
                                .system(
                                    size: 14,
                                    weight: .bold
                                )
                            )
                            .scaleEffect(isChecked ? 1 : 0.1)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Animated Scale Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            AnimatedScaleCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
