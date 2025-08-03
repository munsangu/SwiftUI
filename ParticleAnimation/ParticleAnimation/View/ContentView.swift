import SwiftUI

struct ContentView: View {
    @State var offsetXC = CGFloat.random(in: -10...10)
    @State var offsetYC = CGFloat.random(in: -10...10)
    @State var color: [Color] = [.orange, .green, .purple, .pink]
    @State var colorIndex: Int = 0
    let timer = Timer.publish(
        every: 2,
        on: .main,
        in: .common
    ).autoconnect()
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .shadow(
                    color: .yellow,
                    radius: colorIndex % 2 != 0 ? 2 : 0,
                    x: 0,
                    y: 0
                )
                .multipleObjectAnimation(
                    howManyObjectValue: 30,
                    width: 5,
                    height: 5,
                    color: color[colorIndex],
                    offsetX: offsetXC,
                    offsetY: offsetYC,
                    scaleVB: true,
                    durationAnimation: 2
                )
            
            Rectangle()
                .shadow(
                    color: .yellow,
                    radius: colorIndex % 2 == 0 ? 2 : 0,
                    x: 0,
                    y: 0
                )
                .multipleObjectAnimation(
                    howManyObjectValue: 15,
                    width: 10,
                    height: 10,
                    color: color[colorIndex],
                    offsetX: offsetXC,
                    offsetY: offsetYC,
                    scaleVB: true,
                    durationAnimation: 2
                )
            
            Text("❤️")
                .font(.system(size: 20))
                .multipleObjectAnimation(
                    howManyObjectValue: 5,
                    width: 80,
                    height: 30,
                    color: color[3 - colorIndex],
                    offsetX: offsetXC,
                    offsetY: offsetYC,
                    scaleVB: true,
                    durationAnimation: 2
                )
            
            Text("🔆")
                .shadow(
                    color: .yellow,
                    radius: colorIndex % 2 != 0 ? 4 : 0,
                    x: 0,
                    y: 0
                )
                .font(.system(size: 20))
                .multipleObjectAnimation(
                    howManyObjectValue: 5,
                    width: 80,
                    height: 30,
                    color: color[3 - colorIndex],
                    offsetX: offsetXC,
                    offsetY: offsetYC,
                    scaleVB: true,
                    durationAnimation: 2
                )
            
            Text("Particle Effect")
                .font(.system(size: 18))
                .multipleObjectAnimation(
                    howManyObjectValue: 1,
                    width: 120,
                    height: 30,
                    color: color[3 - colorIndex],
                    offsetX: offsetXC,
                    offsetY: offsetYC,
                    scaleVB: true,
                    durationAnimation: 2
                )
        }
        .onReceive(timer) { _ in
            offsetXC = CGFloat.random(in: -CGFloat(UIScreen.main.bounds.width / 20)...CGFloat(UIScreen.main.bounds.width / 20))
            offsetYC = CGFloat.random(in: -CGFloat(UIScreen.main.bounds.height / 20)...CGFloat(UIScreen.main.bounds.height / 20))
            
            if colorIndex < 3 {
                colorIndex += 1
            } else {
                colorIndex = 0
            }
        }
    }
}

#Preview {
    ContentView()
}
