import SwiftUI
import Shimmer

struct ContentView: View {
    @State private var isExpanded: Bool = false
    private let images = ["image1", "image2", "image3", "image4"]
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.pink.opacity(0.7)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                Text("PickMood")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
                    .padding(
                        .top,
                        10
                    )
                
                Spacer(minLength: 0)
            }
            
            ForEach(
                0..<images.count,
                id: \.self
            ) { index in
                Image(images[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: calculateWidth(for: index),
                        height: calculateHeight(for: index),
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                Color.white,
                                lineWidth: 4
                            )
                    }
                    .shadow(
                        color: Color.black.opacity(0.15),
                        radius: 10,
                        x: 0,
                        y: 10
                    )
                    .rotationEffect(calculateRotation(for: index))
                    .offset(calculateOffset(for: index))
                
            }
            
            if isExpanded {
                VStack {
                    Spacer(minLength: 0)
                    
                    Button {
                        
                    } label: {
                        Text("Get Started")
                            .shimmering()
                            .font(.system(size: 30).bold())
                            .foregroundStyle(.white)
                            .padding()
                            .padding(
                                .horizontal,
                                40
                            )
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    .transition(.opacity)
                    .animation(
                        .easeInOut,
                        value: isExpanded
                    )
                    .padding(
                        .bottom,
                        50
                    )
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring()) {
                    isExpanded = true
                }
            }
        }
    }
    
    private func calculateWidth(for index: Int) -> CGFloat {
        switch index {
        case 0: return 160
        case 1: return 180
        case 2: return 190
        case 3: return 170
        default: return 150
        }
    }
    
    private func calculateHeight(for index: Int) -> CGFloat {
        switch index {
        case 0: return 200
        case 1: return 200
        case 2: return 140
        case 3: return 180
        default: return 210
        }
    }
    
    private func calculateRotation(for index: Int) -> Angle {
        if isExpanded {
            return .degrees(Double(index) * 5 - 10)
        } else {
            return .degrees(0)
        }
    }
    
    private func calculateOffset(for index: Int) -> CGSize {
        if isExpanded {
            switch index {
            case 0: return CGSize(width: -80, height: -180)
            case 1: return CGSize(width: 80, height: -110)
            case 2: return CGSize(width: -80, height: 50)
            case 3: return CGSize(width: 80, height: 120)
            default: return .zero
            }
        } else {
            return CGSize(width: 0, height: CGFloat(index) * 15)
        }
    }
}

#Preview {
    ContentView()
}
