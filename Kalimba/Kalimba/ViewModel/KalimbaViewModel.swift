import Foundation
import AVFoundation

class KalimbaViewModel: ObservableObject {
    @Published var keys: [KalimbaKey] = []
    private var audioPlayer: AVAudioPlayer?

    init() {
        setupKeys()
    }

    private func setupKeys() {
        keys = [
            KalimbaKey(
                note: "C4",
                soundFile: "C4",
                keyWidth: 50,
                keyHeight: 240,
                isLeftAligned: true
            ),
            KalimbaKey(
                note: "D4",
                soundFile: "D4",
                keyWidth: 48,
                keyHeight: 230,
                isLeftAligned: false
            ),
            KalimbaKey(
                note: "E4",
                soundFile: "E4",
                keyWidth: 46,
                keyHeight: 220,
                isLeftAligned: true
            ),
            KalimbaKey(
                note: "F4",
                soundFile: "F4",
                keyWidth: 44,
                keyHeight: 210,
                isLeftAligned: false
            ),
            KalimbaKey(
                note: "G4",
                soundFile: "G4",
                keyWidth: 42,
                keyHeight: 200,
                isLeftAligned: true
            ),
            KalimbaKey(
                note: "A4",
                soundFile: "A4",
                keyWidth: 40,
                keyHeight: 190,
                isLeftAligned: false
            ),
            KalimbaKey(
                note: "B4",
                soundFile: "B4",
                keyWidth: 38,
                keyHeight: 180,
                isLeftAligned: true
            ),
            KalimbaKey(
                note: "C5",
                soundFile: "C5",
                keyWidth: 36,
                keyHeight: 170,
                isLeftAligned: false
            )
        ]
    }

    func playSound(for key: KalimbaKey) {
        guard let url = Bundle.main.url(
            forResource: key.soundFile,
            withExtension: "wav"
        ) else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound for \(key.note): \(error.localizedDescription)")
        }
    }
}
