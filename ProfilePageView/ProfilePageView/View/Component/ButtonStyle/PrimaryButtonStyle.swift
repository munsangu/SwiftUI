import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(
                .vertical,
                12
            )
            .background(Color.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}
