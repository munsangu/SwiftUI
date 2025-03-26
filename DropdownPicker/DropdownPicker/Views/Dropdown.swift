import SwiftUI

struct DropdownView: View {
    var values: [String]
    @Binding var config: DropdownConfig
    @ObservedObject var viewModel: DropdownViewModel
    @State private var activeItem: String?
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ItemView(config.activeText)
                    .id(config.activeText)
                
                ForEach(
                    filteredValues,
                    id: \.self
                ) { item in
                    ItemView(item)
                }
            }
            .scrollTargetLayout()
        }
        .safeAreaPadding(
            .bottom,
            200 - config.anchor.height
        )
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        .scrollPosition(
            id: $activeItem,
            anchor: .top
        )
        .scrollIndicators(.hidden)
        .frame(
            width: config.anchor.width,
            height: 200
        )
        .background(.background)
        .mask(alignment: .top) {
            Rectangle()
                .frame(
                    height: config.showContent ? 200 : config.anchor.height,
                    alignment: .top
                )
        }
        .overlay(alignment: .topTrailing) {
            Image(systemName: "chevron.down")
                .rotationEffect(.init(degrees: config.showContent ? 180 : 0))
                .padding(
                    .trailing,
                    15
                )
                .frame(height: config.anchor.height)
        }
        .clipShape(.rect(cornerRadius: config.cornerRadius))
        .offset(
            x: config.anchor.minX,
            y: config.anchor.minY
        )
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background {
            if config.showContent {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .reverseMask(.topLeading) {
                        RoundedRectangle(cornerRadius: config.cornerRadius)
                            .frame(
                                width: config.anchor.width,
                                height: 200
                            )
                            .offset(
                                x: config.anchor.minX,
                                y: config.anchor.minY
                            )
                    }
                    .transition(.opacity)
                    .onTapGesture {
                        closeDropdown(activeItem ?? config.activeText)
                    }
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func ItemView(_ item: String) -> some View {
        HStack {
            Text(item)
            
            Spacer(minLength: 0)
        }
        .padding(
            .horizontal,
            15
        )
        .frame(height: config.anchor.height)
        .contentShape(.rect)
        .onTapGesture {
            closeDropdown(item)
        }
    }
    
    func closeDropdown(_ item: String) {
        withAnimation(
            .easeInOut(duration: 0.35),
            completionCriteria: .logicallyComplete
        ) {
            activeItem = item
            config.showContent = false
        } completion: {
            config.activeText = item
            config.show = false
        }
    }
    
    var filteredValues: [String] {
        values.filter({ $0 != config.activeText })
    }
}
