import SwiftUI

extension ScrollView {
    func onScrollGeometryChange<T: Equatable>(
        for type: T.Type,
        initialValue: T? = nil,
        _ geometryReader: @escaping (GeometryProxy) -> T,
        action: @escaping (T, T) -> Void
    ) -> some View {
        self.modifier(
            GeometryChangedModifier(
                geometryReader: geometryReader,
                initialValue: initialValue,
                action: action
            )
        )
    }
    
    func onScrollPhaseChange(
        _ action: @escaping (ScrollPhase, ScrollPhase) -> Void
    ) -> some View {
        self.modifier(
            ScrollPhaseChangeModifier(
                action: action
            )
        )
    }
}

struct GeometryChangedModifier<T: Equatable>: ViewModifier {
    let geometryReader: (GeometryProxy) -> T
    let action: (T, T) -> Void
    
    @State private var previousValue: T?
    
    init(geometryReader: @escaping (GeometryProxy) -> T, initialValue: T? = nil, action: @escaping (T, T) -> Void) {
        self.geometryReader = geometryReader
        self.action = action
        self._previousValue = State(initialValue: initialValue)
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            let newValue = geometryReader(proxy)
                            if let prevValue = previousValue {
                                action(prevValue, newValue)
                            }
                            previousValue = newValue
                        }
                        .onChange(of: geometryReader(proxy)) { oldValue, newValue in
                            guard let prevValue = previousValue, newValue != prevValue else { return }
                            action(prevValue, newValue)
                            previousValue = newValue
                        }
                }
            )
    }
}

struct ScrollPhaseChangeModifier: ViewModifier {
    let action: (ScrollPhase, ScrollPhase) -> Void
    @State private var previousPhase: ScrollPhase = .unknown
    
    func body(content: Content) -> some View {
        content
            .onScrollPhaseChanged { phase in
                action(previousPhase, phase)
                previousPhase = phase
            }
    }
}

enum ScrollPhase: Equatable {
    case unknown
    case scrolling
    case idle
    
    var isScrolling: Bool {
        self == .scrolling
    }
}

extension View {
    func onScrollPhaseChanged(
        _ action: @escaping (ScrollPhase) -> Void
    ) -> some View {
        self.background(
            GeometryReader { proxy in
                Color.clear
                    .preference(key: ScrollPhaseKey.self, value: .scrolling)
                    .onPreferenceChange(ScrollPhaseKey.self) { phase in
                        action(phase)
                    }
            }
        )
    }
}

struct ScrollPhaseKey: PreferenceKey {
    static var defaultValue: ScrollPhase = .unknown
    
    static func reduce(value: inout ScrollPhase, nextValue: () -> ScrollPhase) {
        value = nextValue()
    }
}

extension GeometryProxy {
    var frameSize: CGSize {
        CGSize(
            width: frame(in: .global).width,
            height: frame(in: .global).height
        )
    }
    var containerSize: CGSize {
        CGSize(
            width: safeAreaInsets.leading + safeAreaInsets.trailing + size.width,
            height: safeAreaInsets.top + safeAreaInsets.bottom + size.height
        )
    }
    var contentOffset: CGPoint {
        CGPoint(
            x: frame(in: .global).minX,
            y: frame(in: .global).minY
        )
    }
    var contentSize: CGSize { size }
    var contentInsets: EdgeInsets { safeAreaInsets }
}
