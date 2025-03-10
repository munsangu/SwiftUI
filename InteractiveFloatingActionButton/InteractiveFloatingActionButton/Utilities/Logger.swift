import Foundation
import OSLog

final class Logger {
    private static let osLogger = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "com.app.floatingbutton", category: "General")
    
    static func log(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        let output = "[\(fileName):\(line)] \(function) - \(message)"
        os_log(.debug, log: osLogger, "%{public}@", output)
        #endif
    }

    static func logError(_ error: Error, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = (file as NSString).lastPathComponent
        let output = "[\(fileName):\(line)] \(function) - Error: \(error.localizedDescription)"
        os_log(.error, log: osLogger, "%{public}@", output)
    }
    

    static func logWarning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = (file as NSString).lastPathComponent
        let output = "[\(fileName):\(line)] \(function) - Warning: \(message)"
        os_log(.info, log: osLogger, "%{public}@", output)
    }
}
