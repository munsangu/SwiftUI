import SwiftUI

struct SettingsRow: View {
    let icon: String
    let title: String
    var body: some View {
        HStack {
            Label {
                Text(title)
            } icon: {
                Image(systemName: icon)
                    .foregroundStyle(.blue)
            }
            
            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .contentShape(Rectangle())
    }
}

#Preview {
    SettingsRow(
        icon: "gear",
        title: "TEST"
    )
}
