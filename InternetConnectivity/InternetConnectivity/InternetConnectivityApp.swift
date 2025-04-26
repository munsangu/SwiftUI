import SwiftUI

@main
struct InternetConnectivityApp: App {
    @StateObject private var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.isNetworkConnected,
                     networkMonitor.isConnected
                )
                .environment(
                    \.connectionType,
                     networkMonitor.connectionType
                )
        }
    }
}
