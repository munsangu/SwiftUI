import SwiftUI

@main
struct NFC_OTPSampleApp: App {
    var body: some Scene {
        WindowGroup {
            NFCOTPView(viewModel: NFCOTPViewModel())
        }
    }
}
