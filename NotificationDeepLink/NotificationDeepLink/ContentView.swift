import SwiftUI

struct ContentView: View {
    @Environment(AppData.self) private var appData
    var body: some View {
        @Bindable var appData = appData
        NavigationStack(path: $appData.mainPageNavigationPath) {
            List {
                NavigationLink(
                    "View1",
                    value: "View1"
                )
                
                NavigationLink(
                    "View2",
                    value: "View2"
                )
                
                NavigationLink(
                    "View3",
                    value: "View3"
                )
            }
            .navigationTitle("Notification Deep Link")
            .navigationDestination(for: String.self) { value in
                Text("Hello from \(value)")
                    .navigationTitle(value)
            }
        }
        .task {
            let _ = try? await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound ])
        }
    }
}

#Preview {
    ContentView()
}
