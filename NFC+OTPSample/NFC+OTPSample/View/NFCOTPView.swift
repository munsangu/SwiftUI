import SwiftUI

struct NFCOTPView: View {
    @StateObject var viewModel: NFCOTPViewModel

       var body: some View {
           NavigationStack {
               VStack(spacing: 16) {
                   HStack {
                       Text("状態")
                           .font(.headline)
                       
                       Spacer()
                       
                       Text(viewModel.status)
                           .multilineTextAlignment(.trailing)
                   }

                   HStack {
                       Text("IDm")
                           .font(.headline)
                       
                       Spacer()
                       
                       Text(viewModel.idmHex.isEmpty ? "-" : viewModel.idmHex)
                           .font(.system(.body, design: .monospaced))
                           .textSelection(.enabled)
                           .lineLimit(1)
                           .minimumScaleFactor(0.6)
                   }

                   HStack(spacing: 12) {
                       Button {
                           viewModel.startScan()
                       } label: {
                           Label("Start Scan", systemImage: "play.circle.fill")
                               .frame(maxWidth: .infinity).padding(.vertical, 12)
                       }
                       .disabled(!viewModel.canReadNFC)
                       .buttonStyle(.borderedProminent)

                       Button {
                           viewModel.stopScan()
                       } label: {
                           Label("Stop", systemImage: "stop.circle.fill")
                               .frame(maxWidth: .infinity).padding(.vertical, 12)
                       }
                       .buttonStyle(.bordered)
                   }

                   if let otpViewModel = viewModel.otpViewModel {
                       OTPCardView(viewModel: otpViewModel)
                           .transition(.opacity)
                   }

                   Spacer()
               }
               .padding()
               .navigationTitle("NFC(F-Type) → OTP")
           }
       }
}

#Preview {
    NFCOTPView(viewModel: NFCOTPViewModel())
}
