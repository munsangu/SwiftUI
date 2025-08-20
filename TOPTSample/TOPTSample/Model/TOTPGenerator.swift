import Foundation
import CryptoKit

enum TOTPAlgorithm { case sha1, sha256, sha512 }
enum TOTPError: Error { case invalidBase32 }

struct TOTPGenerator {
    let secret: Data
    let digits: Int
    let period: Int
    let algorithm: TOTPAlgorithm

    init(
        secretBase32: String,
        digits: Int = 6,
        period: Int = 30,
        algorithm: TOTPAlgorithm = .sha1
    ) throws {
        guard let data = Base32.decode(secretBase32) else { throw TOTPError.invalidBase32 }
        self.secret = data
        self.digits = digits
        self.period = period
        self.algorithm = algorithm
    }

    func generate(at date: Date = Date()) -> String {
        let counter = UInt64(floor(date.timeIntervalSince1970 / Double(period)))
        var be = counter.bigEndian
        let counterData = withUnsafeBytes(of: &be) { Data($0) }

        let macData: Data
        switch algorithm {
        case .sha1:
            macData = Data(HMAC<Insecure.SHA1>
                .authenticationCode(
                    for: counterData,
                    using: SymmetricKey(data: secret)
                )
            )
        case .sha256:
            macData = Data(HMAC<SHA256>
                .authenticationCode(
                    for: counterData,
                    using: SymmetricKey(data: secret)
                )
            )
        case .sha512:
            macData = Data(HMAC<SHA512>
                .authenticationCode(
                    for: counterData,
                    using: SymmetricKey(data: secret)
                )
            )
        }

        guard let lastByte = macData.last else {
            return String(
                repeating: "0",
                count: digits
            )
        }
        let offset = Int(lastByte & 0x0f)
        guard macData.count >= offset + 4 else {
            return String(
                repeating: "0",
                count: digits
            )
        }

        let p0 = UInt32(macData[offset]   & 0x7f) << 24
        let p1 = UInt32(macData[offset+1] & 0xff) << 16
        let p2 = UInt32(macData[offset+2] & 0xff) << 8
        let p3 = UInt32(macData[offset+3] & 0xff)
        var code = p0 | p1 | p2 | p3
        
        let mod = Self.pow10(digits)
        code = code % mod

        return String(
            format: "%0*u",
            digits, code
        )
    }

    private static func pow10(_ n: Int) -> UInt32 {
        var r: UInt32 = 1
        for _ in 0..<n { r *= 10 }
        return r
    }
}

private enum Base32 {
    private static let map: [Character: UInt8] = {
        let chars = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ234567")
        var dict: [Character: UInt8] = [:]
        for (i, ch) in chars.enumerated() { dict[ch] = UInt8(i) }
        return dict
    }()

    static func decode(_ s: String) -> Data? {
        var buffer: UInt32 = 0
        var bitsLeft = 0
        var out = [UInt8]()
        for ch in s.uppercased().replacingOccurrences(
            of: "=",
            with: ""
        ).filter({ !$0.isWhitespace && $0 != "-" }) {
            guard let v = map[ch] else { return nil }
            buffer = (buffer << 5) | UInt32(v)
            bitsLeft += 5
            if bitsLeft >= 8 {
                bitsLeft -= 8
                let byte = UInt8((buffer >> UInt32(bitsLeft)) & 0xff)
                out.append(byte)
                buffer &= (1 << bitsLeft) - 1
            }
        }
        return Data(out)
    }
}
