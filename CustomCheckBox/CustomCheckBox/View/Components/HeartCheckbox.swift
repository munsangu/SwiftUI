import SwiftUI

struct HeartCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            Button {
                withAnimation(
                    .spring(
                        response: 0.4,
                        dampingFraction: 0.6
                    )
                ) {
                    isChecked.toggle()
                }
            } label: {
                Image(systemName: isChecked ? "heart.fill" : "heart")
                    .foregroundStyle(isChecked ? .red : .gray)
                    .font(.system(size: 25))
                    .scaleEffect(isChecked ? 1.2 : 1.0)
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Heart Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            HeartCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
