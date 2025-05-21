import SwiftUI

class WordGameViewModel: ObservableObject {
    @Published var wordsToShow: [String] = []
    @Published var correctAnswers: Set<String> = []
    @Published var isQuizStarted: Bool = false

    init() {
        loadWords()
    }

    func loadWords() {
        let allWords = [
            "Banana",
            "Computer",
            "Apple",
            "School",
            "TV",
            "Coffee"
        ]
        wordsToShow = allWords.shuffled().prefix(6).map { $0 }
    }

    func startQuiz() {
        correctAnswers = Set(wordsToShow)
        isQuizStarted = true
    }

    func checkAnswer(word: String) -> String {
        if correctAnswers.contains(word) {
            correctAnswers.remove(word)
            return "Correct! Remaining words: \(correctAnswers.count)"
        } else {
            return "Incorrect. Please try again."
        }
    }
}
