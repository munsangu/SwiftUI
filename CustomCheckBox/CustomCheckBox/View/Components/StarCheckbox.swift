import SwiftUI

struct StarCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            Button {
                withAnimation(
                    .easeIn(duration: 0.3)
                ) {
                    isChecked.toggle()
                }
            } label: {
                Image(systemName: isChecked ? "star.fill" : "star")
                    .foregroundStyle(isChecked ? .yellow : .gray)
                    .font(.system(size: 25))
                    .rotationEffect(.degrees(isChecked ? 72 : 0))
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Star Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            StarCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
