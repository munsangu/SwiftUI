import SwiftUI

struct ContentView: View {
    @State private var showsSplashScreen: Bool = true
    @State private var splashAnimationProgress: Double = 0.0
    var body: some View {
        ZStack {
            if showsSplashScreen {
                SplashScreen(animationProgress: splashAnimationProgress)
                    .transition(CustomSplashTransition2(isRoot: false))
            } else {
                TabView {
                    Tab.init("Home", systemImage: "house") {
                        Text("Home")
                    }
                    
                    Tab.init("Search", systemImage: "magnifyingglass") {
                        Text("Search")
                    }
                    
                    Tab.init("Settings", systemImage: "gearshape") {
                        Text("Settings")
                    }
                }
                .transition(CustomSplashTransition2(isRoot: true))
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(.black)
        .ignoresSafeArea()
//        .task {
//            guard !showsSplashScreen else { return }
//            try? await Task.sleep(for: .seconds(1.0))
//            withAnimation(.smooth(duration: 0.55)) {
//                showsSplashScreen = false
//            }
//        }
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(1.0))
                
                withAnimation(.easeInOut(duration: 0.7)) {
                    splashAnimationProgress = 0.33
                }
                
                try? await Task.sleep(for: .seconds(1.2))
                
                withAnimation(.easeInOut(duration: 0.7)) {
                    splashAnimationProgress = 0.66
                }
                
                try? await Task.sleep(for: .seconds(1.2))
                
                withAnimation(.easeInOut(duration: 0.7)) {
                    splashAnimationProgress = 1.0
                }
                
                try? await Task.sleep(for: .seconds(1.0))
                
                withAnimation(.smooth(duration: 0.55)) {
                    showsSplashScreen = false
                }
            }
        }
    }
    
    var safeArea: UIEdgeInsets {
        if let safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets {
            return safeArea
        }
        
        return .zero
    }
}

struct CustomSplashTransition2: Transition {
    var isRoot: Bool
    func body(
        content: Content,
        phase: TransitionPhase
    ) -> some View {
        content
            .rotation3DEffect(
                .init(
                    degrees: phase.isIdentity ? 0 : isRoot ? 70 : -70
                 ),
                axis: (
                    x: 0,
                    y: 1,
                    z: 0
                ),
                anchor: isRoot ? .leading : .trailing
            )
            .offset(x: phase.isIdentity ? 0 : isRoot ? screenSize.width : -screenSize.width)
    }
    
    var screenSize: CGSize {
        if let screenSize = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size {
            return screenSize
        }
        
        return .zero
    }
}

struct CustomSplashTransition: Transition {
    var isRoot: Bool
    func body(
        content: Content,
        phase: TransitionPhase
    ) -> some View {
        content
            .offset(y: phase.isIdentity ? 0 : isRoot ? screenSize.height : -screenSize.height)
    }
    
    var screenSize: CGSize {
        if let screenSize = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size {
            return screenSize
        }
        
        return .zero
    }
}

struct SplashScreen: View {
    var animationProgress: Double
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.splashBackground)
            
            Image("LogoIcon")
                .scaleEffect(1.0 - (0.7 * animationProgress))
                .opacity(1.0)
        }
        .ignoresSafeArea()
    }
    
    private func getZoomOutScale(progress: Double) -> Double {
        if progress < 0.33 {
            return 1.0 - (0.3 * (progress / 0.33))
        } else if progress < 0.66 {
            let adjustedProgress = (progress - 0.33) / 0.33
            return 0.7 - (0.2 * adjustedProgress)
        } else {
            let adjustedProgress = (progress - 0.66) / 0.34
            return 0.5 - (0.15 * adjustedProgress)
        }
    }
}

#Preview {
    ContentView()
}
