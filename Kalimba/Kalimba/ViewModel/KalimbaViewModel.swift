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
                note: "C5",
                soundFile: "C5",
                keyWidth: 44,
                heightRatio: 0.6,
                isLeftAligned: false
            ),
            KalimbaKey(
                note: "B4",
                soundFile: "B4",
                keyWidth: 44,
                heightRatio: 0.65,
                isLeftAligned: true
            ),
            KalimbaKey(
                note: "A4",
                soundFile: "A4",
                keyWidth: 44,
                heightRatio: 0.7,
                isLeftAligned: false
            ),
            KalimbaKey(
                note: "G4",
                soundFile: "G4",
                keyWidth: 44,
                heightRatio: 0.75,
                isLeftAligned: true
            ),
            KalimbaKey(
                note: "F4",
                soundFile: "F4",
                keyWidth: 44,
                heightRatio: 0.8,
                isLeftAligned: false
            ),
            KalimbaKey(
                note: "E4",
                soundFile: "E4",
                keyWidth: 44,
                heightRatio: 0.85,
                isLeftAligned: true
            ),
            KalimbaKey(
                note: "D4",
                soundFile: "D4",
                keyWidth: 44,
                heightRatio: 0.9,
                isLeftAligned: false
            ),
            KalimbaKey(
                note: "C4",
                soundFile: "C4",
                keyWidth: 44,
                heightRatio: 1.0,
                isLeftAligned: true
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
