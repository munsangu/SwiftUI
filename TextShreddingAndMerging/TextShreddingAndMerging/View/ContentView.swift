import SwiftUI

struct ContentView: View {
    @State private var ready: Bool = false
    @State private var show: Bool = true
    @Namespace private var namespace
    @ObservedObject private var input = TextLimiter(limit: 8)
    @State private var show1: Bool = false
    @State private var color: Color = .white
    @State private var colors: [Color] = [
        .red, .orange, .yellow, .blue, .purple, .green, .pink,
        .red, .orange, .yellow, .blue, .purple, .green, .pink,
        .red, .orange, .yellow, .blue, .purple, .green, .pink
    ]
    let timer = Timer.publish(
        every: 2,
        on: .main,
        in: .common
    ).autoconnect()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            if ready {
                GeometryReader { proxy in
                    let chars = texts(text: input.value)
                    
                    HStack {
                        ForEach(Array(chars.enumerated()), id: \.offset) { index, char in
                            AnimatedCharView(
                                char: char,
                                index: index,
                                width: proxy.size.width,
                                height: proxy.size.height,
                                centerY: proxy.size.height / 2,
                                totalCount: chars.count,
                                show: show,
                                show1: show1,
                                color: color,
                                namespace: namespace,
                                timer: timer,
                                colors: colors,
                                currentColor: $color
                            )
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            
            VStack {
                Text("Write Text Animation")
                    .font(.title)
                    .foregroundStyle(.white)
                    .shadow(
                        color: .orange,
                        radius: 2,
                        x: 3,
                        y: 3
                    )
                    .multilineTextAlignment(.center)
                
                HStack {
                    TextField(
                        "Write Text...",
                        text: $input.value
                    )
                    .frame(
                        width: 100,
                        height: 40
                    )
                    .background(Color.orange)
                    .onTapGesture {
                        ready = false
                        show = true
                        show1 = false
                    }
                    .border(
                        Color.red,
                        width: input.hasReachedLimit ? 1 : 0
                    )
                    .cornerRadius(15)
                    .multilineTextAlignment(.center)
                    
                    Button {
                        withAnimation(
                            .spring(
                                response: 0.8,
                                dampingFraction: 3
                            )
                        ) {
                            ready = true
                            show.toggle()
                        }
                    } label: {
                        Capsule()
                            .frame(
                                width: 120,
                                height: 40
                            )
                            .overlay(
                                Text(show ? "Shred Text" : "Merge Text")
                                    .foregroundStyle(.white)
                            )
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 2)) {
                            show1.toggle()
                            color = colors.randomElement() ?? .white
                        }
                    } label: {
                        Capsule()
                            .frame(
                                width: 120,
                                height: 40
                            )
                            .overlay(
                                Text("Color Move")
                                    .foregroundStyle(.white)
                            )
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
    
    private func texts(text: String) -> [String] {
        text.map { String($0) }
    }
}

#Preview {
    ContentView()
}
