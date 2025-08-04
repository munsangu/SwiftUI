import SwiftUI

struct CircularCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            Button {
                withAnimation(.spring) {
                    isChecked.toggle()
                }
            } label: {
                ZStack {
                    Circle()
                        .stroke(
                            isChecked ? Color.green : Color.gray,
                            lineWidth: 2
                        )
                        .frame(
                            width: 25,
                            height: 25
                        )
                    
                    Circle()
                        .fill(isChecked ? Color.green : Color.clear)
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
                            .scaleEffect(isChecked ? 1 : 0)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Circular Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            CircularCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
