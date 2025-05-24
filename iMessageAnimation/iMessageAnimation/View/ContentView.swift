import SwiftUI

struct ContentView: View {
    @State private var config: MenuConfig = .init(symbolImage: "plus")
    var body: some View {
        CustomMenuView(config: $config) {
            NavigationStack {
                ScrollView(.vertical) {
                    
                }
                .navigationTitle("Messages")
                .safeAreaInset(edge: .bottom) {
                    BottomBar(config: $config)
                }
            }
        } actions: {
            MenuAction(
                symbolImage: "camera",
                text: "Camera"
            )
             MenuAction(
                symbolImage: "photo.on.rectangle.angled",
                text: "Photos"
             )
             MenuAction(
                symbolImage: "face.smiling",
                text: "Genmoji"
             )
             MenuAction(
                symbolImage: "waveform",
                text: "Audio"
             )
             MenuAction(
                symbolImage: "apple.logo",
                text: "App Store"
             )
             MenuAction(
                symbolImage: "video.badge.waveform",
                text: "Facetime"
             )
             MenuAction(
                symbolImage: "rectangle.and.text.magnifyingglass",
                text: "#Images"
             )
             MenuAction(
                symbolImage: "suit.heart",
                text: "Digital Touch"
             )
             MenuAction(
                symbolImage: "location",
                text: "Location"
             )
             MenuAction(
                symbolImage: "music.note",
                text: "Music"
             )
        }
    }
}

#Preview {
    ContentView()
}
