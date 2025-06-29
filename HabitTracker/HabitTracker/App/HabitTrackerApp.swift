import SwiftUI

@main
struct HabitTrackerApp: App {
    init() {
        NotificationManager.shared.requestPermission()
    }
    
    var body: some Scene {
        WindowGroup {
            HabitListView()
        }
    }
}
