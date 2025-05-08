import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.5
    var body: some View {
        NavigationStack {
            List {
                if let audioURL {
                    Section("Audio.mp3") {
                        WaveformScrubber(
                            url: audioURL,
                            progress: $progress
                        ) { info in
                            print(info.duration)
                        } onGestureActive: { status in
                            
                        }
                        .frame(height: 60)
                    }
                }
                
                Slider(value: $progress)
            }
            .navigationTitle("Waveform Scrubber")
        }
    }
    
    var audioURL: URL? {
        Bundle.main.url(forResource: "Audio", withExtension: "mp3")
    }
}

#Preview {
    ContentView()
}
