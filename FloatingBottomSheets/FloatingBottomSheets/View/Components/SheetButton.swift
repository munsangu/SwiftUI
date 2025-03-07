import SwiftUI

struct SheetButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
        }
        .background(color)
        .cornerRadius(8)
    }
}

#Preview {
    HStack {
        SheetButton(title: "Alert", color: .red, action: {})
        SheetButton(title: "Question", color: .blue, action: {})
        SheetButton(title: "Request", color: .green, action: {})
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
