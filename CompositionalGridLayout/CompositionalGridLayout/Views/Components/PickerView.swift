import SwiftUI

struct PickerView: View {
    @Binding var selectedCount: Int
    let availableCounts: ClosedRange<Int>
    
    init(
        selectedCount: Binding<Int>,
        availableCounts: ClosedRange<Int> = 1...4
    ) {
        self._selectedCount = selectedCount
        self.availableCounts = availableCounts
    }
    
    var body: some View {
        Picker("Count", selection: $selectedCount) {
            ForEach(availableCounts, id: \.self) { count in
                Text("Count = \(count)")
                    .tag(count)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom, 10)
    }
}

#Preview {
    PickerView(selectedCount: .constant(2))
        .padding()
}
