import SwiftUI

struct WheelPickerView<Label: View>: View {
    var range: ClosedRange<Int>
    @Binding var selectedValue: Int
    var config: WheelPickerConfig = .init()
    @ViewBuilder var label: (Int) -> Label
    @State private var activePosition: Int?
    var body: some View {
        GeometryReader {
            let size = $0.size
            let width = size.width - (config.strokeStyle.lineWidth)
            let dia = min(
                            max(
                                width,
                                size.height
                            ),
                            width
                        )
            let radius = dia / 2
            
            wheelPath(
                size,
                radius: radius
            )
            .stroke(
                config.strokeColor,
                style: config.strokeStyle
            )
            .overlay {
                wheelPickerScrollView(size: size, radius: radius)
            }
            .compositingGroup()
            .offset(y: -config.strokeStyle.lineWidth / 23)
        }
        .frame(height: config.height)
        .task {
            guard activePosition == nil else { return }
            activePosition = selectedValue
        }
        .onChange(of: activePosition) { oldValue, newValue in
            if let newValue, selectedValue != newValue {
                selectedValue = newValue
            }
        }
        .onChange(of: selectedValue) { oldValue, newValue in
            if activePosition != newValue {
                activePosition = newValue
            }
        }
        .onScrollPhaseChange { oldPhase, newPhase in
            if newPhase == .idle {
                Task {
                    activePosition = nil
                    try? await Task.sleep(for: .seconds(0))
                    activePosition = selectedValue
                }
            }
        }
    }
    
    @ViewBuilder
    func wheelPickerScrollView(
        size: CGSize,
        radius: CGFloat
    ) -> some View {
        let wheelShape = wheelPath(
            size,
            radius: radius
        )
            .strokedPath(config.strokeStyle)
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(
                    ticks,
                    id: \.self
                ) { tick in
                    TickView(
                        tick,
                        size: size,
                        radius: radius
                    )
                    .frame(
                        maxHeight: .infinity,
                        alignment: .bottom
                    )
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled(true)
        .safeAreaPadding(
            .horizontal,
            (size.width - 8) / 2
        )
        .scrollTargetBehavior(
            .viewAligned(
                limitBehavior: .alwaysByOne
            )
        )
        .scrollPosition(
            id: $activePosition,
            anchor: .center
        )
        .clipShape(wheelShape)
        .contentShape(wheelShape)
        .overlay(alignment: .bottom) {
            let strokeWidth =  config.strokeStyle.lineWidth
            let halfStrokeWidth = strokeWidth / 2
            
            VStack(spacing: -5) {
                Capsule()
                    .fill(config.activeTint)
                    .frame(
                        width: 5,
                        height: strokeWidth
                    )
                
                Circle()
                    .fill(config.activeTint)
                    .frame(
                        width: 10,
                        height: 10
                    )
            }
            .offset(y: -radius + halfStrokeWidth)
        }
        .overlay(alignment: .bottom) {
            if let activePosition {
                label(activePosition)
                    .frame(
                        maxWidth: radius,
                        maxHeight: radius - (config.strokeStyle.lineWidth / 2)
                    )
            }
        }
    }
    
    @ViewBuilder
    func TickView(
        _ value: Int,
        size: CGSize,
        radius: CGFloat
    ) -> some View {
        let strokeWidth = config.strokeStyle.lineWidth
        let halfStrokeWidth = strokeWidth / 2
        let isLargeTick = (ticks.firstIndex(of: value) ?? 0) % config.largeTickFrequency == 0
        
        GeometryReader { proxy in
            let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
            let midX = proxy.frame(in: .scrollView(axis: .horizontal)).midX
            let halfWidth = size.width / 2
            let progress = max(min(midX / halfWidth, 1), -1)
            let rotation = Angle(degrees: progress * 180)
            
            Capsule()
                .fill(config.inactiveTint)
                .offset(y: -radius + halfStrokeWidth)
                .rotationEffect(
                    rotation,
                    anchor: .bottom
                )
                .offset(x: -minX)
        }
        .frame(
            width: 3,
            height: isLargeTick ? (strokeWidth - 10) : halfStrokeWidth
        )
        .frame(
            width: 8,
            alignment: .leading
        )
    }
    
    func wheelPath(
        _ size: CGSize,
        radius: CGFloat
    ) -> Path {
        return Path { path in
            path.addArc(
                center: .init(
                    x: size.width / 2,
                    y: size.height
                ),
                radius: radius,
                startAngle: .degrees(180),
                endAngle: .degrees(0),
                clockwise: false
            )
        }
    }
    
    var ticks: [Int] {
        stride(
            from: range.lowerBound,
            through: range.upperBound,
            by: 1
        ).compactMap({ $0 })
    }
}
