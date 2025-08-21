import Foundation
import Combine

/// 画面用の状態管理（OTP表示/残り秒、ログインURL）
/// - 画面表示直後にOTPを即生成（初回空白を回避）
/// - 1秒タイマーで残り秒とOTPを更新
class OTPViewModel: ObservableObject {
    // UIバインディング用
    @Published private(set) var code: String = ""
    @Published private(set) var remaining: Int = 30
    @Published private(set) var loginURL: URL?
    
    // Direct Grantの検証結果（ステータス表示用）
    @Published var directGrantStatus: String?

    // KeycloakのOTPポリシー（HmacSHA1 / 6桁 / 30秒）
    private let digits = 6
    private let period = 30
    private let secretKey: Data
    
    // Direct Grant 呼び出しに必要な情報を保持
    private let baseAuthURL: String
    private let realm: String
    private let clientId: String

    private var timer: AnyCancellable?

    /// - Parameters:
    ///   - baseAuthURL: 例) "https://v2.key.sandbox.medcom-apps.com" または "/auth"付きでも可
    ///   - realm: 例) "2fatest"
    ///   - urlParams: client_id / redirect_uri / response_type / scope / state / nonce など
    ///   - hospitalCode / idmHex / salt / stretch: Androidと同一値を使用（今回 salt="hoge", stretch=0）
    init?(
        baseAuthURL: String,
        realm: String,
        urlParams: [String: String],
        hospitalCode: String,
        idmHex: String,
        salt: String,
        stretch: Int
    ) {
        // Androidと同じルールでシークレット文字列を導出 → 文字列のバイト列をHMACキーに
        guard
            let secretString = SecretDerivation.deriveSecretString(
                hospitalCode: hospitalCode,
                idmHex: idmHex,
                salt: salt,
                stretch: stretch
            )
        else { return nil }

        self.secretKey = SecretDerivation.otpKeyData(from: secretString)
        
        //  Direct Grant 用にも使うため保持
        self.baseAuthURL = baseAuthURL
        self.realm = realm
        self.clientId = urlParams["client_id"] ?? ""
        
        self.loginURL = URLBuilder.makeAuthURL(
            baseAuthURL: baseAuthURL,
            realm: realm,
            parameters: urlParams
        )

        // 画面初回表示で即時生成（最初の30秒間の空白を回避）
        tick(now: Date())

        // 1秒ごとに残り秒/OTPを更新
        self.timer = Timer
            .publish(
                every: 1,
                on: .main,
                in: .common
            )
            .autoconnect()
            .sink { [weak self] now in self?.tick(now: now) }
    }

    deinit { timer?.cancel() }

    private func tick(now: Date) {
        let rem = TOTP.remaining(period: period, at: now)
        // 周期境界に入ったタイミング、または初回は再生成
        if code.isEmpty || rem == period {
            code = TOTP.generate(
                secret: secretKey,
                digits: digits,
                period: period,
                at: now
            )
        }
        remaining = rem
    }

    /// WebViewに注入する直前に最新OTPを生成して返す
    func makeCurrentOTP() -> String {
        TOTP.generate(
            secret: secretKey,
            digits: digits,
            period: period,
            at: Date()
        )
    }
}
