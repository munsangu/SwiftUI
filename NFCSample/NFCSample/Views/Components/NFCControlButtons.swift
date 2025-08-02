import SwiftUI

struct NFCControlButtons: View {
    let canReadNFC: Bool
    let isReading: Bool
    let onStartReading: () -> Void
    let onStopReading: () -> Void
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                print("Start Scan button tapped")
                onStartReading()
            }) {
                HStack {
                    Image(systemName: "play.circle.fill")
                    Text("Start Scan")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(canReadNFC && !isReading ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .disabled(!canReadNFC || isReading)
            
            Button(action: {
                print("Stop Scan button tapped")
                onStopReading()
            }) {
                HStack {
                    Image(systemName: "stop.circle.fill")
                    Text("Stop Scan")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(isReading ? Color.red : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .disabled(!isReading)
        }
    }
}
