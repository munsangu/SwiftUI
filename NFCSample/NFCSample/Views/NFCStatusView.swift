import SwiftUI

struct NFCStatusView: View {
    let readingState: NFCReadingState
    var body: some View {
        VStack(spacing: 10) {
            switch readingState {
            case .idle:
                StatusCard(
                    icon: "circle",
                    title: "Standby",
                    message: "Ready to scan NFC tags",
                    color: .gray
                )
                
            case .reading:
                StatusCard(
                    icon: "dot.radiowaves.left.and.right",
                    title: "Scanning...",
                    message: "Please hold your NFC tag close to the device",
                    color: .blue
                )
                
            case .success(let nfcData):
                StatusCard(
                    icon: "checkmark.circle.fill",
                    title: "Scan Successful!",
                    message: nfcData.payload,
                    color: .green
                )
                
            case .error(let errorMessage):
                StatusCard(
                    icon: "exclamationmark.triangle.fill",
                    title: "Error Occurred",
                    message: errorMessage,
                    color: .red
                )
            }
        }
    }
}
