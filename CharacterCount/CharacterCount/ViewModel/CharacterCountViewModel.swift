import Foundation

class CharacterCountViewModel: ObservableObject {
    @Published var inputText: String = "" {
        didSet {
            characterCount = inputText.count
        }
    }

    @Published private(set) var characterCount: Int = 0
}
