import SwiftUI

extension View {
    @ViewBuilder
    func floatingBottomSheet<Content: View>(
        isPresented: Binding<Bool>,
        onDismiss: @escaping () -> () = {},
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self
            .sheet(
                isPresented: isPresented,
                onDismiss: onDismiss
            ) {
                content()
                    .presentationCornerRadius(0)
                    .presentationBackground(.clear)
                    .presentationDragIndicator(.hidden)
                    .background(SheetShadowRemover())
            }
    }
}
