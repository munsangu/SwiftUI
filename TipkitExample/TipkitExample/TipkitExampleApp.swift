import SwiftUI
import TipKit

@main
struct TipkitExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
//                    try? Tips.resetDatastore()
                    try? Tips.configure(
                        [
//                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                        ]
                    )
                }
        }
    }
}
