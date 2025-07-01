import Foundation
import AVFoundation

class DrumPadViewModel: ObservableObject {
    @Published var pads: [DrumPad] = [
        DrumPad(
            name: "Kick",
            fileName: "kick",
            fileExtension: "wav",
            label: "Kick"
        ),
        DrumPad(
            name: "Snare",
            fileName: "snare",
            fileExtension: "wav",
            label: "Snare"
        ),
        DrumPad(
            name: "HiHat",
            fileName: "hi-hat",
            fileExtension: "aiff",
            label: "Hi-Hat"
        ),
        DrumPad(
            name: "Crash",
            fileName: "cymbal",
            fileExtension: "aiff",
            label: "Cymbal"
        ),
        DrumPad(
            name: "Tom",
            fileName: "tom",
            fileExtension: "aiff",
            label: "Tom"
        )
    ]
    
    private var player: AVAudioPlayer?

    func playSound(for pad: DrumPad) {
        guard let url = Bundle.main.url(
            forResource: pad.fileName,
            withExtension: pad.fileExtension
        ) else {
            print("⚠️ File not found: \(pad.fileName).\(pad.fileExtension)")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("🎧 Playback error: \(error.localizedDescription)")
        }
    }
}
