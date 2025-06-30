import Foundation
import AVFoundation

class SoundButtonViewModel: ObservableObject {
    @Published var buttons: [SoundButton] = [
        SoundButton(
            title: "Drum",
            soundFileName: "drum.wav"
        ),
        SoundButton(
            title: "Bell",
            soundFileName: "bell.wav"
        ),
        SoundButton(
            title: "Clap",
            soundFileName: "clap.wav"
        )
    ]
    
    private var player: AVAudioPlayer?

    func playSound(for button: SoundButton) {
        guard let url = Bundle.main.url(
            forResource: button.soundFileName.replacingOccurrences(
                of: ".wav",
                with: ""
            ),
            withExtension: "wav"
        ) else {
            print("Sound file not found: \(button.soundFileName)")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
