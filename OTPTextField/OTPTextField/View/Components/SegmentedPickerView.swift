import SwiftUI

struct SegmentedPickerView<T: Hashable>: View {
    let title: String
    let options: [T]
    @Binding var selection: T
    let textForOption: (T) -> String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(.gray)
                .padding(.leading, 5)
                .padding(.bottom, 10)
            
            Picker(title, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(textForOption(option))
                        .tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.horizontal)
    }
}
