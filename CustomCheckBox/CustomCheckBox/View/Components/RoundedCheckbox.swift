import SwiftUI

struct RoundedCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeInOut) {
                    isChecked.toggle()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            isChecked ? Color.purple : Color.gray,
                            lineWidth: 2
                        )
                        .frame(
                            width: 25,
                            height: 25
                        )
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isChecked ? Color.purple : Color.clear)
                        .frame(
                            width: 25,
                            height: 25
                        )
                    
                    if isChecked {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.white)
                            .font(
                                .system(
                                    size: 14,
                                    weight: .bold
                                )
                            )
                            .rotationEffect(.degrees(isChecked ? 0 : -90))
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Rounded Square Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            RoundedCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
