import SwiftUI

struct ChipView: View {
    let chip: ChipModel
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Text(chip.title)
                .font(.callout)
                .foregroundStyle(isSelected ? .white : Color.primary)
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background {
            ZStack {
                Capsule()
                    .fill(.background)
                    .opacity(!isSelected ? 1 : 0)
                
                Capsule()
                    .fill(.green.gradient)
                    .opacity(isSelected ? 1 : 0)
            }
        }
    }
}

#Preview {
    ChipView(chip: ChipModel(title: "SwiftUI"), isSelected: true)
}
