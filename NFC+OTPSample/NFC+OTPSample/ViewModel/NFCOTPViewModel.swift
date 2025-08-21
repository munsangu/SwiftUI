import Foundation
import Combine

class NFCOTPViewModel: ObservableObject {
    @Published var nfcViewModel = NFCReaderViewModel()

    @Published private(set) var status: String = "待機"
    @Published private(set) var idmHex: String = ""
    @Published var otpViewModel: OTPViewModel? = nil

    private var bag = Set<AnyCancellable>()

    private let targetIDmLower = "0123456789997656"

    private let otpConfig = OTPConfig(
        baseAuthURL: "https://example.com/auth",
        realm: "sample",
        urlParams: ["client_id": "log-app"],
        hospitalCode: "code",
        salt: "test",
        stretch: 0
    )

    init() {
        nfcViewModel.$readingState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self else { return }
                switch state {
                case .idle:
                    self.status = "待機中"
                case .reading:
                    self.status = "スキャン中… タグをかざしてください"
                case .error(let message):
                    self.status = "エラー: \(message)"
                    self.idmHex = ""
                    self.otpViewModel = nil
                case .success(let data):
                    let lower = Self.extractIDmLowercased(from: data.payload)
                    self.idmHex = lower ?? ""
                    self.status = lower == nil ? "IDm 解析に失敗しました" : "読取成功 (IDm: \(self.idmHex))"
                    self.handleIDm(lowerIDm: lower)
                }
            }
            .store(in: &bag)
    }

    var canReadNFC: Bool { nfcViewModel.canReadNFC }
    func startScan() { nfcViewModel.startNFCReading() }
    func stopScan() { nfcViewModel.stopNFCReading() }
    var history: [NFCData] { nfcViewModel.nfcDataHistory }
    func clearHistory() { nfcViewModel.clearHistory() }

    private func handleIDm(lowerIDm: String?) {
        guard let lowerIDm else {
            otpViewModel = nil
            return
        }
        if lowerIDm == targetIDmLower {
            otpViewModel = nil
            otpViewModel = OTPViewModel(
                baseAuthURL: otpConfig.baseAuthURL,
                realm: otpConfig.realm,
                urlParams: otpConfig.urlParams,
                hospitalCode: otpConfig.hospitalCode,
                idmHex: lowerIDm,
                salt: otpConfig.salt,
                stretch: otpConfig.stretch
            )
            if otpViewModel == nil {
                status = "OTP 初期化に失敗（シークレット導出失敗）"
            }
        } else {
            otpViewModel = nil
        }
    }

    private static func extractIDmLowercased(from payload: String) -> String? {
        guard let range = payload.range(of: "IDm:", options: .caseInsensitive) else { return nil }
        let hex = payload[range.upperBound...]
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard !hex.isEmpty, hex.count % 2 == 0,
              hex.allSatisfy({ $0.isNumber || ("a"..."f").contains($0.lowercased()) }) else {
            return nil
        }
        return hex.lowercased()
    }
}

struct OTPConfig {
    let baseAuthURL: String
    let realm: String
    let urlParams: [String: String]
    let hospitalCode: String
    let salt: String
    let stretch: Int
}
