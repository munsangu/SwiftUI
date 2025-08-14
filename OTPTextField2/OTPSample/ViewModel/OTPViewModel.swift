import Foundation

class OTPViewModel: ObservableObject {
    @Published var otpCode: String = ""
    @Published var shouldNavigate: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var statusMessage: String = ""
    @Published var issuedOTP: String = ""

    private let baseURL = "https://myURL.com"

    var isOTPComplete: Bool { otpCode.count == 6 }

    func requestOTP() {
        guard let url = URL(string: baseURL) else { return }

        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = ["action":"request"]
        req.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: req) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.statusMessage = "Request failed: \(error.localizedDescription)"
                    return
                }
                guard let data = data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    self.statusMessage = "Failed to parse response"
                    return
                }
                self.statusMessage = json["message"] as? String ?? ""
                self.issuedOTP = "\(json["otp"] ?? "")"
            }
        }.resume()
    }

    func verifyOTP() {
        guard let url = URL(string: baseURL) else { return }

        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = ["action":"verify","otp":otpCode]
        req.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: req) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.statusMessage = "Verification failed: \(error.localizedDescription)"
                    self.showErrorAlert = true
                    return
                }
                guard let data = data,
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    self.statusMessage = "Failed to parse response"
                    self.showErrorAlert = true
                    return
                }

                if let success = json["success"] as? Bool, success {
                    self.statusMessage = json["message"] as? String ?? "Verified"
                    self.shouldNavigate = true
                } else {
                    self.statusMessage = json["error"] as? String ?? "OTP verification failed"
                    self.showErrorAlert = true
                }
            }
        }.resume()
    }

    func resetOTP() {
        otpCode = ""
    }
}
