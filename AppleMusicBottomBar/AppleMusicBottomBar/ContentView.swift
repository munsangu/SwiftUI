import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var expandMiniPlayer: Bool = false
    @Namespace private var animation
    var body: some View {
        Group {
            if #available(iOS 26, *) {
                NativeTapView()
                    .tabBarMinimizeBehavior(.onScrollDown)
                    .tabViewBottomAccessory {
                        MiniPlayerView()
                            .matchedTransitionSource(
                                id: "MINIPLAYER",
                                in: animation
                            )
                            .onTapGesture {
                                expandMiniPlayer.toggle()
                            }
                    }
            } else {
                NativeTapView(60)
                    .overlay(alignment: .bottom) {
                        MiniPlayerView()
                            .padding(
                                .vertical,
                                8
                            )
                            .background(
                                .ultraThinMaterial,
                                in: .rect(
                                    cornerRadius: 15,
                                    style: .continuous
                                )
                            )
                            .matchedTransitionSource(
                                id: "MINIPLAYER",
                                in: animation
                            )
                            .onTapGesture {
                                expandMiniPlayer.toggle()
                            }
                            .offset(y: -60)
                            .padding(
                                .horizontal,
                                15
                            )
                    }
                    .ignoresSafeArea(
                        .keyboard,
                        edges: .all
                    )
            }
        }
        .fullScreenCover(isPresented: $expandMiniPlayer) {
            ScrollView {
                
            }
            .safeAreaInset(
                edge: .top,
                spacing: 0
            ) {
                VStack(spacing: 10) {
                    Capsule()
                        .fill(.primary.secondary)
                        .frame(
                            width: 35,
                            height: 3
                        )
                    
                    HStack(spacing: 0) {
                        PlayerInfo(
                            .init(
                                width: 80,
                                height: 80
                            )
                        )
                        
                        Spacer(minLength: 0)
                        
                        Group {
                            Button(
                                "",
                                systemImage: "star.circle.fill"
                            ) {
                                
                            }
                            
                            Button(
                                "",
                                systemImage: "ellipsis.circle.fill"
                            ) {
                                
                            }
                        }
                        .font(.title)
                        .foregroundStyle(
                            Color.primary,
                            Color.primary.opacity(0.1)
                        )
                    }
                    .padding(
                        .horizontal,
                        15
                    )
                }
                .navigationTransition(
                    .zoom(
                        sourceID: "MINIPLAYER",
                        in: animation
                    )
                )
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(.background)
        }
    }
    
    @ViewBuilder
    func NativeTapView(_ safeAreaBottomPadding: CGFloat = 0) -> some View {
        TabView {
            Tab.init(
                "Home",
                systemImage: "house.fill"
            ) {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Home")
                    .safeAreaPadding(
                        .bottom,
                        safeAreaBottomPadding
                    )
                }
            }
            
            Tab.init(
                "New",
                systemImage: "square.grid.2x2.fill"
            ) {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("What's New")
                    .safeAreaPadding(
                        .bottom,
                        safeAreaBottomPadding
                    )
                }
            }
            
            Tab.init(
                "Radio",
                systemImage: "dot.radiowaves.left.and.right"
            ) {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Radio")
                    .safeAreaPadding(
                        .bottom,
                        safeAreaBottomPadding
                    )
                }
            }
            
            Tab.init(
                "Library",
                systemImage: "square.stack.fill"
            ) {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Library")
                    .safeAreaPadding(
                        .bottom,
                        safeAreaBottomPadding
                    )
                }
            }
            
            Tab.init(
                "Search",
                systemImage: "magnifyingglass",
                role: .search
            ) {
                NavigationStack {
                    List {
                        
                    }
                    .navigationTitle("Search")
                    .searchable(
                        text: $searchText,
                        placement: .toolbar,
                        prompt: Text("Search...")
                    )
                    .safeAreaPadding(
                        .bottom,
                        safeAreaBottomPadding
                    )
                }
            }
        }
    }
    
    @ViewBuilder
    func PlayerInfo(_ size: CGSize) -> some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: size.height / 4)
                .fill(.blue.gradient)
                .frame(
                    width: size.width,
                    height: size.height
                )
            
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                Text("Some Apple Music Title")
                    .font(.callout)
                
                Text("Some Artist Name")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
        }
    }
    
    @ViewBuilder
    func MiniPlayerView() -> some View {
        HStack(spacing: 15) {
            PlayerInfo(
                .init(
                    width: 30,
                    height: 30
                )
            )
            
            Spacer(minLength: 0)
            
            Button {
                
            } label: {
                Image(systemName: "play.fill")
                    .contentShape(.rect)
            }
            .padding(
                .trailing,
                10
            )
            
            Button {
                
            } label: {
                Image(systemName: "forward.fill")
                    .contentShape(.rect)
            }
        }
        .foregroundStyle(Color.primary)
        .padding(
            .horizontal,
            15
        )
    }
}

#Preview {
    ContentView()
}
