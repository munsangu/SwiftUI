import SwiftUI

extension View {
    @ViewBuilder
    func systemTrayView<Content: View>(
        _ show: Binding<Bool>,
        config: TrayConfig = .init(maxDetent: .fraction(0.99)),
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self
            .sheet(isPresented: show) {
                content()
                    .background(.background)
                    .clipShape(.rect(cornerRadius: config.cornerRadius))
                    .padding(
                        .horizontal,
                        config.horizontalPadding
                    )
                    .padding(
                        .bottom,
                        config.bottomPadding
                    )
                    .frame(
                        maxHeight: .infinity,
                        alignment: .bottom
                    )
                    .presentationDetents([config.maxDetent])
                    .presentationCornerRadius(0)
                    .presentationBackground(.clear)
                    .presentationDragIndicator(.hidden)
                    .interactiveDismissDisabled(config.isInteractiveDismissDisabled)
                    .background(RemoveSheetShadow())
            }
    }
}

fileprivate struct RemoveSheetShadow: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let shadowView = view.dropShadowView {
                shadowView.layer.shadowColor = UIColor.clear.cgColor
            }
        }
        
        return view
    }
    
    func updateUIView(
        _ uiView: UIView,
        context: Context
    ) {
        
    }
}
