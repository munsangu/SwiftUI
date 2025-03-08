import SwiftUI

extension View {
    @ViewBuilder
    func onGeometryChange<Value: Equatable>(
        for keyPath: KeyPath<GeometryProxy, Value>,
        of transform: @escaping (GeometryProxy) -> Value,
        action: @escaping (Value) -> Void
    ) -> some View {
        self.background {
            GeometryReader { geometry in
                let value = transform(geometry)
                
                Color.clear
                    .onAppear {
                        action(value)
                    }
                    .onChange(of: value) { newValue in
                        action(newValue)
                    }
            }
        }
    }
}
