import SwiftUI

struct CustomSlider<Overlay: View>: View {
    @Binding var value: CGFloat
    var range: ClosedRange<CGFloat>
    var config: SliderConfig
    var overlay: Overlay
    @State private var lastStoredValue: CGFloat
    @GestureState private var isActive: Bool = false

    init(
        value: Binding<CGFloat>,
        in range: ClosedRange<CGFloat>,
        config: SliderConfig = SliderConfig(),
        @ViewBuilder overlay: @escaping () -> Overlay
    ) {
        self._value = value
        self.range = range
        self.config = config
        self.overlay = overlay()
        self.lastStoredValue = value.wrappedValue
    }
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let width = (value / range.upperBound) * size.width
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(config.inActiveTint)
            
                Rectangle()
                    .fill(config.activeTint)
                    .mask(alignment: .leading) {
                        Rectangle()
                            .frame(width: width)
                    }
                
                ZStack(alignment: .leading) {
                    overlay
                        .foregroundStyle(config.overlayInActiveTint)
                    
                    overlay
                        .foregroundStyle(config.overlayActiveTint)
                        .mask(alignment: .leading) {
                            Rectangle()
                                .frame(width: width)
                        }
                }
                .compositingGroup()
                .animation(
                    .easeIn(duration: 0.3)
                    .delay(isActive ? 0.12 : 0)
                    .speed(isActive ? 1 : 2)) {
                        $0.opacity(isActive ? 1 : 0)
                    }
            }
            .contentShape(.rect())
            .highPriorityGesture(
                DragGesture(minimumDistance: 0)
                    .updating($isActive) { _, out, _ in
                        out = true
                    }
                    .onChanged { value in
                        let progress = ((value.translation.width / size.width) * range.upperBound) + lastStoredValue
                        self.value = max(min(progress, range.upperBound), range.lowerBound)
                    }
                    .onEnded { _ in
                        lastStoredValue = value
                    }
            )
        }
        .frame(height: 20 + config.extraHeight)
        .mask {
            RoundedRectangle(cornerRadius: config.cornerRadius)
                .frame(height: 20 + (isActive ? config.extraHeight : 0))
        }
        .animation(
            .snappy,
            value: isActive
        )
    }
}

#Preview {
    VStack {
        CustomSlider(
            value: .constant(30),
            in: 0...100
        ) {
            HStack {
                Image(systemName: "speaker.wave.3.fill", variableValue: 0.3)
                Spacer(minLength: 0)
                Text("30.0%").font(.callout)
            }
            .padding(.horizontal, 20)
        }
    }
    .padding(15)
}
