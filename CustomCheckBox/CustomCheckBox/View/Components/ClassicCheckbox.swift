import SwiftUI

struct ClassicCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isChecked.toggle()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(
                            isChecked ? Color.blue : Color.gray,
                            lineWidth: 2
                        )
                        .frame(
                            width: 25,
                            height: 25
                        )
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(isChecked ? Color.blue : Color.gray)
                        }
                    
                    if isChecked {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.white)
                            .font(
                                .system(
                                    size: 16,
                                    weight: .bold
                                )
                            )
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Classic Square Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            ClassicCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
