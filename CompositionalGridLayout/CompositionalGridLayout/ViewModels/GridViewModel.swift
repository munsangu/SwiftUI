import Foundation
import Combine

final class GridViewModel: ObservableObject {
    @Published var columnCount: Int = 3
    @Published private(set) var items: [GridItemModel] = []
    let spacing: CGFloat = 6
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadItems()
        
        $columnCount
            .sink { [weak self] _ in
                self?.loadItems()
            }
            .store(in: &cancellables)
    }
    
    func loadItems() {
        items = GridItemModel.mockItems(count: 50)
    }
    
    func updateColumnCount(_ count: Int) {
        guard count >= 1 && count <= 4 else { return }
        columnCount = count
    }
}
