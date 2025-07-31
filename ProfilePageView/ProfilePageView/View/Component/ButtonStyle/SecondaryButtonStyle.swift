import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(
                .vertical,
                12
            )
            .background(Color(.secondarySystemBackground))
            .foregroundStyle(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
