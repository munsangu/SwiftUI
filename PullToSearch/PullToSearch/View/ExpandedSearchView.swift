import SwiftUI

struct ExpandedSearchView: View {
    @FocusState.Binding var isExpanded: Bool
    var body: some View {
        List {
            let colors: [Color] = [.black, .indigo, .cyan]
            
            if isExpanded {
                ForEach(
                    colors,
                    id: \.self
                ) { color in
                    Section(String.init(describing: color).capitalized) {
                        ForEach(
                            1...5,
                            id: \.self
                        ) { index in
                            HStack(spacing: 10) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(color.gradient)
                                    .frame(
                                        width: 40,
                                        height: 40
                                    )
                                
                                Text("Search Item No: \(index)")
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(
                        .init(
                            top: 12,
                            leading: 0,
                            bottom: 12,
                            trailing: 0
                        )
                    )
                }
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .clipped()
    }
}
