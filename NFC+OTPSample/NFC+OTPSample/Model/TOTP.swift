import Foundation
import CryptoKit

// MARK: - Secret Derivation（Androidと同じ規則でシークレット文字列を作る）
enum SecretDerivation {
    /// Androidの createSecret 相当:
    /// secretString = Base64(パディング無し)( hospitalCode.bytes + idm(bytes) + salt.bytes )
    /// 注意: stretch=0 のため、ハッシュ反復は行わない
    static func deriveSecretString(
        hospitalCode: String,
        idmHex: String,
        salt: String,
        stretch: Int
    ) -> String? {
        // IDmは16進文字列 → バイト列に変換（大文字/小文字は不問）
        guard let idm = Data(hexString: idmHex) else { return nil }
        // 連結: hospitalCode.bytes + idm.bytes + salt.bytes
        var seed = hospitalCode.data(using: .utf8)! + idm + salt.data(using: .utf8)!
        // stretch回、SHA-256を適用（今回の要件は0回）
        for _ in 0..<stretch {
            seed = Data(SHA256.hash(data: seed))
        }
        // Base64（パディング "=" を除去）→ これを「文字列」として保持
        return seed.base64EncodedString().replacingOccurrences(of: "=", with: "")
    }

    /// OTPのHMACキーとして使うバイト列を返す
    /// 重要: Base64をデコードせず、文字列のUTF-8バイト列をそのまま使用（Androidの toByteArray() と同じ）
    static func otpKeyData(from secretString: String) -> Data {
        Data(secretString.utf8)
    }
}

private extension Data {
    /// 16進文字列 → Data 変換ユーティリティ
    init?(hexString: String) {
        let string = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        guard string.count % 2 == 0 else { return nil }
        var data = Data(capacity: string.count/2)
        var idx = string.startIndex
        for _ in 0..<(string.count/2) {
            let next = string.index(idx, offsetBy: 2)
            guard let b = UInt8(string[idx..<next], radix: 16) else { return nil }
            data.append(b)
            idx = next
        }
        self = data
    }
}

// MARK: - TOTP（HmacSHA1 / 6桁 / 30秒）
enum TOTP {
    /// 現在時刻に基づきOTPを生成
    static func generate(
        secret key: Data,
        digits: Int = 6,
        period: Int = 30,
        at date: Date = .now
    ) -> String {
        // 30秒ごとのカウンタ値（8バイトBig-Endian）
        let counter = UInt64(date.timeIntervalSince1970) / UInt64(period)
        var be = counter.bigEndian
        let msg = Data(
            bytes: &be,
            count: MemoryLayout.size(ofValue: be)
        )

        // HMAC-SHA1
        let mac = Data(HMAC<Insecure.SHA1>.authenticationCode(
                for: msg,
                using: SymmetricKey(data: key)
            )
        )

        // Dynamic Truncation（RFC準拠）
        let offset = Int(mac.last! & 0x0f)
        let p0 = UInt32(mac[offset]   & 0x7f) << 24
        let p1 = UInt32(mac[offset+1] & 0xff) << 16
        let p2 = UInt32(mac[offset+2] & 0xff) << 8
        let p3 = UInt32(mac[offset+3] & 0xff)
        let binCode = p0 | p1 | p2 | p3

        // 指定桁数で丸め（6桁）
        let mod = pow10(digits)
        let code = binCode % mod
        return String(
            format: "%0*u",
            digits, code
        )
    }

    /// 残り秒数（period=30 の場合、0〜30）
    static func remaining(
        period: Int = 30,
        at date: Date = .now
    ) -> Int {
        let sec = Int(date.timeIntervalSince1970)
        return period - (sec % period)
    }

    private static func pow10(_ n: Int) -> UInt32 {
        var r: UInt32 = 1
        for _ in 0..<n { r *= 10 }
        return r
    }
}
