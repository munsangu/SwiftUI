import SwiftUI

class GameViewModel: ObservableObject {
    @Published var board: [GameCell] = Array(
                                                repeating: GameCell(player: nil),
                                                count: 9
                                            )
    @Published var currentPlayer: Player = .x
    @Published var winner: Player?
    @Published var isDraw: Bool = false

    func tapCell(at index: Int) {
        guard board[index].player == nil, winner == nil else { return }

        board[index].player = currentPlayer
        checkGameStatus()
        
        if winner == nil {
            currentPlayer = currentPlayer.next
        }
    }

    func checkGameStatus() {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        
        for pattern in winPatterns {
            if let firstPlayer = board[pattern[0]].player,
               board[pattern[1]].player == firstPlayer,
               board[pattern[2]].player == firstPlayer {
                winner = firstPlayer
                return
            }
        }
        
        if board.allSatisfy({ $0.player != nil }) {
            isDraw = true
        }
    }

    func resetGame() {
        board = Array(
                        repeating: GameCell(player: nil),
                        count: 9
                    )
        currentPlayer = .x
        winner = nil
        isDraw = false
    }
}
