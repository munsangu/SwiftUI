import Foundation

class OTPViewModel: ObservableObject {
    @Published var otpCode: String = ""
    @Published var shouldNavigate: Bool = false
    @Published var showErrorAlert: Bool = false
    
    var isOTPComplete: Bool {
        otpCode.count == 6
    }
    
    func verifyOTP() {
        if otpCode == "123456" {
            shouldNavigate = true
        } else {
            showErrorAlert = true
            shouldNavigate = false
        }
    }
    
    func resetOTP() {
        otpCode = ""
    }
}
