import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var gameItems: [GameItem] = []
    @Published var elapsedTime: TimeInterval = 0
    @Published var isGameOver = false

    private var timer: Timer?
    private var startDate: Date?

    init() {
        startGame()
    }

    func startGame() {
        let items = (0..<15).map { _ in GameItem(type: .A) } +
                    (0..<15).map { _ in GameItem(type: .B) }
        gameItems = items.shuffled()
        startDate = Date()
        startTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.1,
            repeats: true
        ) { [weak self] _ in
            guard let self, let start = startDate else { return }
            self.elapsedTime = Date().timeIntervalSince(start)
        }
    }

    func processUserInput(
        for type: GameType,
        completion: @escaping () -> Void
    ) {
        guard let current = gameItems.first, current.type == type else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.removeCurrentItem()
            completion()
        }
    }

    private func removeCurrentItem() {
        if !gameItems.isEmpty {
            gameItems.removeFirst()
        }

        if gameItems.isEmpty {
            timer?.invalidate()
            isGameOver = true
        }
    }
}
