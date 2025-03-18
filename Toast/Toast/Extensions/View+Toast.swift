import SwiftUI

extension View {
    @ViewBuilder
    func interactiveToasts(_ toasts: Binding<[Toast]>) -> some View {
        self
            .frame(
                width: .infinity,
                height: .infinity
            )
            .overlay(alignment: .bottom) {
                ToastsView(toasts: toasts)
            }
    }
}
