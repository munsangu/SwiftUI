import SwiftUI

struct SwitchCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            Button {
                withAnimation(.spring()) {
                    isChecked.toggle()
                }
            } label: {
                ZStack {
                    Capsule()
                        .fill(isChecked ? Color.green : Color.gray.opacity(0.3))
                        .frame(
                            width: 50,
                            height: 30
                        )
                    
                    Circle()
                        .fill(Color.white)
                        .frame(
                            width: 26,
                            height: 26
                        )
                        .offset(x: isChecked ? 10 : -10)
                        .shadow(radius: 2)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("Switch Style Checkbox")
                .font(.body)
        }
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var isChecked = false

        var body: some View {
            SwitchCheckbox(isChecked: $isChecked)
                .padding()
        }
    }

    return PreviewContainer()
}
