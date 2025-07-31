import SwiftUI

struct SignOutButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 3)
    }
}
