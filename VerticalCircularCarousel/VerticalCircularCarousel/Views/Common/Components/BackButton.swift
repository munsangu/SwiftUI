import SwiftUI

struct BackButton: View {
    let action: () -> Void
    var iconName: String = "arrow.left"
    var foregroundStyle: Color = .primary
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(.title3.bold())
                .foregroundStyle(foregroundStyle)
                .contentShape(Rectangle())
                .accessibility(label: Text("Back"))
        }
    }
}

#Preview {
    BackButton(action: {})
        .previewLayout(.sizeThatFits)
        .padding()
        .preferredColorScheme(.dark)
}
