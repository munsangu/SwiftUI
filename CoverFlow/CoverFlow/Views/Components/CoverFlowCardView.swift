import SwiftUI

struct CoverFlowCardView: View {
    let item: CoverFlowItem
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(item.color.gradient)
    }
}
