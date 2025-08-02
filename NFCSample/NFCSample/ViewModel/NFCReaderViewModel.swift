import Foundation
import CoreNFC

class NFCReaderViewModel: NSObject, ObservableObject {
    @Published var readingState: NFCReadingState = .idle
    @Published var nfcDataHistory: [NFCData] = []
    
    private var nfcSession: NFCNDEFReaderSession?
    
    var canReadNFC: Bool {
        return NFCNDEFReaderSession.readingAvailable
    }
    
    func startNFCReading() {
        print("startNFCReading() called")
        
        guard canReadNFC else {
            print("NFC not available on this device")
            readingState = .error("This device does not support NFC.")
            return
        }
        
        nfcSession = NFCNDEFReaderSession(
            delegate: self,
            queue: nil,
            invalidateAfterFirstRead: true
        )
        nfcSession?.alertMessage = "Please scan your NFC tag"
        nfcSession?.begin()
        
        readingState = .reading
        print("NFC session started")
    }
    
    func stopNFCReading() {
        print("stopNFCReading() called")
        
        nfcSession?.invalidate()
        nfcSession = nil
        
        readingState = .idle
        print("NFC session stopped")
    }
    
    func clearHistory() {
        nfcDataHistory.removeAll()
        print("NFC history cleared")
    }
    
    private func addToHistory(_ nfcData: NFCData) {
        DispatchQueue.main.async {
            self.nfcDataHistory.insert(nfcData, at: 0)
            print("Added to history: \(nfcData.payload)")
        }
    }
}

extension NFCReaderViewModel: NFCNDEFReaderSessionDelegate {
    func readerSession(
        _ session: NFCNDEFReaderSession,
        didInvalidateWithError error: Error
    ) {
        print("NFC session invalidated with error: \(error)")
        
        DispatchQueue.main.async {
            if let nfcError = error as? NFCReaderError {
                switch nfcError.code {
                case .readerSessionInvalidationErrorUserCanceled:
                    print("User canceled NFC session")
                    self.readingState = .idle
                case .readerSessionInvalidationErrorSessionTimeout:
                    print("NFC session timeout")
                    self.readingState = .error("Session timeout occurred.")
                default:
                    print("Other NFC error: \(error.localizedDescription)")
                    self.readingState = .error("NFC reading error: \(error.localizedDescription)")
                }
            } else {
                print("Unknown error: \(error.localizedDescription)")
                self.readingState = .error("Unknown error: \(error.localizedDescription)")
            }
        }
    }
    
    func readerSession(
        _ session: NFCNDEFReaderSession,
        didDetectNDEFs messages: [NFCNDEFMessage]
    ) {
        print("NFC tags detected: \(messages.count) messages")
        
        var resultString = ""
        
        for message in messages {
            print("Processing message with \(message.records.count) records")
            for record in message.records {
                if let payloadString = String(
                    data: record.payload,
                    encoding: .utf8
                ) {
                    print("Record payload: \(payloadString)")
                    resultString += payloadString
                }
            }
        }
        
        let nfcData = NFCData(payload: resultString.isEmpty ? "Empty data" : resultString)
        print("Created NFCData: \(nfcData.payload)")
        
        DispatchQueue.main.async {
            self.readingState = .success(nfcData)
            self.addToHistory(nfcData)
            print("Successfully processed NFC data")
        }
    }
}
