import SwiftUI

struct NFCHistoryItem: View {
    let nfcData: NFCData
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        return formatter.string(from: nfcData.timestamp)
    }
    
    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                Text(nfcData.payload)
                    .font(.system(.body, design: .monospaced))
                    .lineLimit(2)
                
                Text("\(nfcData.type) • \(formattedTime)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "doc.on.doc")
                .font(.caption)
                .foregroundColor(.blue)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .onTapGesture {
            UIPasteboard.general.string = nfcData.payload
        }
    }
}
