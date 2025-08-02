import SwiftUI

struct NFCHistoryView: View {
    let history: [NFCData]
    let onClearHistory: () -> Void
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {
            HStack {
                Text("Scan History")
                    .font(.headline)
                
                Spacer()
                
                if !history.isEmpty {
                    Button(
                        "Clear All",
                        action: onClearHistory
                    )
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            
            if history.isEmpty {
                Text("No NFC tags have been scanned yet")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center
                    )
                    .padding()
            } else {
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(history) { nfcData in
                            NFCHistoryItem(nfcData: nfcData)
                        }
                    }
                }
                .frame(maxHeight: 200)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(12)
    }
}
