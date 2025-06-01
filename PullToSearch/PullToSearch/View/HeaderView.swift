import SwiftUI

struct HeaderView: View {
    @FocusState.Binding var isExpanded: Bool
    let progress: CGFloat
    var body: some View {
        HStack(spacing: 20) {
            if !isExpanded {
                Button {
                    
                } label: {
                    Image(systemName: "slider.horizontal.below.square.filled.and.square")
                        .font(.title3)
                }
                .transition(.blurReplace)
            }
            
            TextField(
                "Search App",
                text: .constant("")
            )
            .padding(
                .horizontal,
                15
            )
            .padding(
                .vertical,
                10
            )
            .background {
                ZStack {
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                    
                    Rectangle()
                        .fill(.ultraThinMaterial)
                }
                .clipShape(.rect(cornerRadius: 15))
            }
            .focused($isExpanded)
            
            Button {
                
            } label: {
                Image(systemName: "person.circle.fill")
                    .font(.title2)
            }
            .opacity(isExpanded ? 0 : 1)
            .overlay(alignment: .trailing) {
                Button("Cancel") {
                    isExpanded = false
                }
                .fixedSize()
                .opacity(isExpanded ? 1 : 0)
            }
            .padding(
                .leading,
                isExpanded ? 20 : 0
            )
        }
        .foregroundStyle(Color.primary)
        .padding(
            .horizontal,
            15
        )
        .padding(
            .top,
            10
        )
        .padding(
            .bottom,
            5
        )
        .background {
            Rectangle()
                .fill(.background)
                .ignoresSafeArea()
                .opacity(progress == 0 && !isExpanded ? 1 : 0)
        }
    }
}
