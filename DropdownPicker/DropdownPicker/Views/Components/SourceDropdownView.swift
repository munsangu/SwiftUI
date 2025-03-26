import SwiftUI

struct SourceDropdownView: View {
    @ObservedObject var viewModel: DropdownViewModel
    @Binding var config: DropdownConfig
    
    var body: some View {
        HStack {
            Text(config.activeText)
            
            Spacer(minLength: 0)
            
            Image(systemName: "chevron.down")
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(
            .background,
            in: .rect(cornerRadius: config.cornerRadius)
        )
        .contentShape(.rect(cornerRadius: config.cornerRadius))
        .onTapGesture {
            config.show = true
            withAnimation(.snappy(
                duration: 0.35,
                extraBounce: 0
                )
            ) {
                config.showContent = true
            }
        }
        .onGeometryChange { rect in
            config.anchor = rect
        }
    }
}
