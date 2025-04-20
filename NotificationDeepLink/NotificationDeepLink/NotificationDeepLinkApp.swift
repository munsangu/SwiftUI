import SwiftUI

@main
struct NotificationDeepLinkApp: App {
    @UIApplicationDelegateAdaptor(AppData.self) private var appData
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appData)
                .onOpenURL { url in
                    if let pageName = url.host() {
                        appData.mainPageNavigationPath.append(pageName)
                    }
                }
        }
    }
}

@Observable
class AppData: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var mainPageNavigationPath: [String] = []
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification)
    async -> UNNotificationPresentationOptions {
        return [.sound, .banner]
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) async {
        if let pageLink = response.notification.request.content.userInfo["pageLink"] as? String {
//            if mainPageNavigationPath.last != pageLink {
//                mainPageNavigationPath = []
//                mainPageNavigationPath.append(pageLink)
//            }
            guard let url = URL(string: pageLink) else { return }
            UIApplication.shared.open(
                url,
                options: [:]
            ) { _ in
                
            }
        }
    }
}
