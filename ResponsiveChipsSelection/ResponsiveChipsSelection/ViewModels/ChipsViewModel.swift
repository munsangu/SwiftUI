import Foundation
import Combine

class ChipsViewModel: ObservableObject {
    @Published var chips: [ChipModel] = []
    @Published var selectedChips: [ChipModel] = []
    
    var onSelectionChanged: (([ChipModel]) -> Void)?
    
    init(tags: [String]) {
        self.chips = tags.map { ChipModel(title: $0) }
    }
    
    func toggleSelection(for chip: ChipModel) {
        if let index = chips.firstIndex(where: { $0.id == chip.id }) {
            chips[index].isSelected.toggle()
            if chips[index].isSelected {
                selectedChips.append(chips[index])
            } else {
                selectedChips.removeAll(where: { $0.id == chip.id })
            }
            
            onSelectionChanged?(selectedChips)
        }
    }
    
    func isSelected(_ chip: ChipModel) -> Bool {
        return selectedChips.contains(where: { $0.id == chip.id })
    }
    
    func getSelectedTitles() -> [String] {
        return selectedChips.map { $0.title }
    }
}
