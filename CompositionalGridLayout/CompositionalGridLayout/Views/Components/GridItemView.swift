import SwiftUI

struct GridItemView: View {
    let item: GridItemModel
    
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .overlay {
                Text(item.title)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
            }
    }
}

#Preview {
    GridItemView(item: GridItemModel(id: 1, title: "1"))
        .frame(width: 100, height: 100)
}
