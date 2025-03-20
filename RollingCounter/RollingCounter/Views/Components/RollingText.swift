import SwiftUI

struct RollingText: View {
    var font: Font
    var weight: Font.Weight
    @Binding var value: Int
    @State private var animationRange: [Int] = []
    
    init(
        font: Font = .largeTitle,
        weight: Font.Weight = .regular,
        value: Binding<Int>
    ) {
        self.font = font
        self.weight = weight
        self._value = value
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(
                0..<animationRange.count,
                id: \.self
            ) { index in
                digitView(at: index)
            }
        }
        .onAppear {
            initializeAnimationRange()
        }
        .onChange(of: value) { newValue in
            handleValueChange()
        }
    }
    
    private func digitView(at index: Int) -> some View {
        Text("8")
            .font(font)
            .fontWeight(weight)
            .opacity(0)
            .overlay {
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    VStack(spacing: 0) {
                        ForEach(
                            0...9,
                            id: \.self
                        ) { number in
                            Text("\(number)")
                                .font(font)
                                .fontWeight(weight)
                                .frame(
                                    width: size.width,
                                    height: size.height,
                                    alignment: .center
                                )
                        }
                    }
                    .offset(y: -CGFloat(animationRange[index]) * size.height)
                }
                .clipped()
            }
    }
    
    private func initializeAnimationRange() {
        animationRange = Array(
            repeating: 0,
            count: "\(value)".count
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
            updateText()
        }
    }
    
    private func handleValueChange() {
        let extra = "\(value)".count - animationRange.count
        
        if extra > 0 {
            appendDigits(count: extra)
        } else if extra < 0 {
            removeDigits(count: -extra)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            updateText()
        }
    }
    
    private func appendDigits(count: Int) {
        for _ in 0..<count {
            withAnimation(.easeIn(duration: 0.1)) {
                animationRange.append(0)
            }
        }
    }

    private func removeDigits(count: Int) {
        for _ in 0..<count {
            withAnimation(.easeIn(duration: 0.1)) {
                animationRange.removeLast()
            }
        }
    }
    
    private func updateText() {
        let stringValue = "\(value)"
        
        for (index, value) in zip(0..<stringValue.count, stringValue) {
            var fraction = Double(index) * 0.15
            fraction = (fraction > 0.5 ? 0.5 : fraction)
            
            withAnimation(
                .interactiveSpring(
                    response: 0.8,
                    dampingFraction: 1 + fraction,
                    blendDuration: 1 + fraction
                )
            ) {
                animationRange[index] = (String(value) as NSString).integerValue
            }
        }
    }
}
