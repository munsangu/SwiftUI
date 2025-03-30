import SwiftUI

extension View {
    @ViewBuilder
    func fillButton(_ color: Color) -> some View {
        self
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding(
                .vertical,
                15
            )
            .background(
                color,
                in: .rect(cornerRadius: 15)
            )
    }
}
