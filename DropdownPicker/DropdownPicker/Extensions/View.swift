import SwiftUI

extension View {
    @ViewBuilder
    func onGeometryChange(
        action: @escaping (_ rect: CGRect) -> Void
    ) -> some View {
        self.background {
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        action(geometry.frame(in: .global))
                    }
                    .onChange(of: geometry.size) { _, _ in
                        action(geometry.frame(in: .global))
                    }
            }
        }
    }
    
    @ViewBuilder
    func reverseMask<Content: View>(
        _ alignment: Alignment,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self
            .mask {
                Rectangle()
                    .overlay(alignment: alignment) {
                        content()
                            .blendMode(.destinationOut)
                    }
            }
    }
    
    @ViewBuilder
    func dropdownOverlay(
        _ config: Binding<DropdownConfig>,
        values: [String],
        viewModel: DropdownViewModel
    ) -> some View {
        self
            .overlay {
                if config.wrappedValue.show {
                    DropdownView(
                        values: values,
                        config: config,
                        viewModel: viewModel
                    )
                    .transition(.identity)
                }
            }
    }
}
