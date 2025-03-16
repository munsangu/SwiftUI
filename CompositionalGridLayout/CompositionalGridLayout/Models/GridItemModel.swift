import Foundation

struct GridItemModel: Identifiable {
    let id: Int
    let title: String
    
    static func mockItems(count: Int) -> [GridItemModel] {
        return (1...count).map { index in
            GridItemModel(
                id: index,
                title: "\(index)"
            )
        }
    }
}
