import SwiftUI

struct ContentView: View {
    @StateObject private var nfcViewModel = NFCReaderViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView()
                
                NFCStatusView(readingState: nfcViewModel.readingState)
                
                NFCControlButtons(
                    canReadNFC: nfcViewModel.canReadNFC,
                    isReading: nfcViewModel.readingState == .reading,
                    onStartReading: nfcViewModel.startNFCReading,
                    onStopReading: nfcViewModel.stopNFCReading
                )
                
                NFCHistoryView(
                    history: nfcViewModel.nfcDataHistory,
                    onClearHistory: nfcViewModel.clearHistory
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("NFC Reader")
        }
    }
}

#Preview {
    ContentView()
}
