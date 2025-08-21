import Foundation
import CoreNFC

class NFCReaderViewModel: NSObject, ObservableObject {
    @Published var readingState: NFCReadingState = .idle
    @Published var nfcDataHistory: [NFCData] = []

    private var nfcSession: NFCTagReaderSession?

    var canReadNFC: Bool {
        return NFCTagReaderSession.readingAvailable
    }

    func startNFCReading() {
        print("startNFCReading() が呼び出されました")

        guard canReadNFC else {
            print("このデバイスではNFCが利用できません")
            readingState = .error("このデバイスはNFCをサポートしていません。")
            return
        }

        nfcSession = NFCTagReaderSession(
            pollingOption: [.iso14443, .iso18092],
            delegate: self,
            queue: nil
        )
        nfcSession?.alertMessage = "NFCタグをスキャンしてください"
        nfcSession?.begin()

        readingState = .reading
        print("NFCセッションが開始されました")
    }

    func stopNFCReading() {
        print("stopNFCReading() が呼び出されました")
        nfcSession?.invalidate()
        nfcSession = nil
        if case .reading = readingState {
            readingState = .idle
        }
        print("NFCセッションが停止しました")
    }
    
    func clearHistory() {
        nfcDataHistory.removeAll()
        print("NFC履歴が消去されました")
    }

    private func addToHistory(_ nfcData: NFCData) {
        DispatchQueue.main.async {
            self.nfcDataHistory.insert(nfcData, at: 0)
            print("履歴に追加されました: \(nfcData.payload)")
        }
    }
}

extension NFCReaderViewModel: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("Session: \(session)")
    }
    // セッションが無効になった際に呼び出されるデリゲートメソッド
    func tagReaderSession(
        _ session: NFCTagReaderSession,
        didInvalidateWithError error: Error
    ) {
        print("エラーによりNFCセッションが無効化されました: \(error.localizedDescription)")
        DispatchQueue.main.async {
            // ユーザーによるキャンセルエラーか確認
            if let nfcError = error as? NFCReaderError, nfcError.code == .readerSessionInvalidationErrorUserCanceled {
                self.readingState = .idle
                print("ユーザーがNFCセッションをキャンセルしました")
            } else {
                self.readingState = .error("NFCエラー: \(error.localizedDescription)")
            }
        }
    }

    // タグが検出された際に呼び出されるデリゲートメソッド
    func tagReaderSession(
        _ session: NFCTagReaderSession,
        didDetect tags: [NFCTag]
    ) {
        print("NFCタグが検出されました: \(tags.count)個")
        guard let firstTag = tags.first else {
            session.invalidate(errorMessage: "タグが見つかりませんでした。")
            return
        }

        session.connect(to: firstTag) { (error: Error?) in
            if let error = error {
                session.invalidate(errorMessage: "接続に失敗しました: \(error.localizedDescription)")
                return
            }

            var nfcData: NFCData?

            switch firstTag {
            case .miFare(let miFareTag):
                let identifier = miFareTag.identifier.map { String(format: "%.2hhx", $0) }.joined()
                print("MIFAREタグが検出されました。識別子: \(identifier)")
                nfcData = NFCData(payload: "UID: \(identifier)", type: "MIFARE")

            case .iso7816(let iso7816Tag):
                let identifier = iso7816Tag.identifier.map { String(format: "%.2hhx", $0) }.joined()
                print("ISO7816タグが検出されました。識別子: \(identifier)")
                nfcData = NFCData(payload: "UID: \(identifier)", type: "ISO7816 (スマートカード)")

             case .feliCa(let feliCaTag):
                let systemCode = String(format: "%02X%02X", feliCaTag.currentSystemCode[0], feliCaTag.currentSystemCode[1])
                print("System Code: \(systemCode)")
                let idm = feliCaTag.currentIDm.map { String(format: "%.2hhx", $0) }.joined()
                print("FeliCaタグが検出されました。IDm: \(idm)")
                nfcData = NFCData(payload: "IDm: \(idm)", type: "Felica")

            default:
                session.invalidate(errorMessage: "サポートされていないタグタイプです。")
                return
            }
            
            DispatchQueue.main.async {
                if let data = nfcData {
                    self.readingState = .success(data)
                    self.addToHistory(data)
                    print("NFCデータの処理に成功しました")
                }
                session.alertMessage = "スキャンに成功しました！"
                session.invalidate()
            }
        }
    }
}
