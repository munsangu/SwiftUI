import SwiftUI

struct StatsView: View {
    let value: String
    let label: String
    var body: some View {
        VStack {
            Text(value)
                .font(.title3.bold())
            
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    StatsView(
        value: "TEST",
        label: "TEST"
    )
}
