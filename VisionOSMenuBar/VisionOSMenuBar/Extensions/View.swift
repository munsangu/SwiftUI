import SwiftUI

extension View {
    @ViewBuilder
    func onGeometryChange<T: Equatable, Value>(
        for key: KeyPath<GeometryProxy, T>,
        action: @escaping (T) -> Value
    ) -> some View {
        self.background {
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: GeometryPreferenceKey<T, Value>.self,
                        value: action(proxy[keyPath: key])
                    )
            }
        }
    }
}

struct GeometryPreferenceKey<T: Equatable, Value>: PreferenceKey {
    static var defaultValue: Value? { nil }
    
    static func reduce(value: inout Value?, nextValue: () -> Value?) {
        value = nextValue() ?? value
    }
}
