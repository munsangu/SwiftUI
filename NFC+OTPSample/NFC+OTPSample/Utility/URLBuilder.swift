import Foundation

enum URLBuilder {
    /// Androidの "$authUrl/auth/realms/$realm/protocol/openid-connect/auth?$query" と同等のURLを組み立てる
    static func makeAuthURL(
        baseAuthURL: String,
        realm: String,
        parameters: [String: String]
    ) -> URL? {
        // クエリパラメータをURLエンコード
        let query = parameters
            .map { k, v in
                let ek = k.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? k
                let ev = v.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? v
                return "\(ek)=\(ev)"
            }
            .joined(separator: "&")

        // baseAuthURLが /auth を含んでいない場合は補う
        let trimmed = baseAuthURL.hasSuffix("/") ? String(baseAuthURL.dropLast()) : baseAuthURL
        let base = trimmed.contains("/auth") ? trimmed : trimmed + "/auth"

        let urlString = "\(base)/realms/\(realm)/protocol/openid-connect/auth?\(query)"
        return URL(string: urlString)
    }
}
