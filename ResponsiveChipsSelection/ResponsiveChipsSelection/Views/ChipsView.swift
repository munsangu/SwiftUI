import SwiftUI

struct ChipsView<Content: View>: View {
    @ObservedObject var viewModel: ChipsViewModel
    var spacing: CGFloat = 10
    var animation: Animation = .easeInOut(duration: 0.2)
    @ViewBuilder var content: (ChipModel) -> Content
    
    var body: some View {
        CustomChipLayout(spacing: spacing) {
            ForEach(viewModel.chips) { chip in
                content(chip)
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(animation) {
                            viewModel.toggleSelection(for: chip)
                        }
                    }
            }
        }
    }
}

fileprivate struct CustomChipLayout: Layout {
    var spacing: CGFloat
    
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        let width = proposal.width ?? 0
        return .init(
            width: width,
            height: maxHeight(
                proposal: proposal,
                subviews: subviews
            )
        )
    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        var origin = bounds.origin
        
        for subview in subviews {
            let fitSize = subview.sizeThatFits(proposal)
            
            if (origin.x + fitSize.width) > bounds.maxX {
                origin.x = bounds.minX
                origin.y += fitSize.height + spacing
                
                subview.place(
                    at: origin,
                    proposal: proposal
                )
                origin.x += fitSize.width + spacing
            } else {
                subview.place(
                    at: origin,
                    proposal: proposal
                )
                origin.x += fitSize.width + spacing
            }
        }
    }
    
    private func maxHeight(proposal: ProposedViewSize, subviews: Subviews) -> CGFloat {
        var origin: CGPoint = .zero
        
        for subview in subviews {
            let fitSize = subview.sizeThatFits(proposal)
            
            if (origin.x + fitSize.width) > (proposal.width ?? 0) {
                origin.x = 0
                origin.y += fitSize.height + spacing
                
                origin.x += fitSize.width + spacing
            } else {
                origin.x += fitSize.width + spacing
            }
            
            if subview == subviews.last {
                origin.y += fitSize.height
            }
        }
        
        return origin.y
    }
}
