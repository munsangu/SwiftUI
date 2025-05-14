import SwiftUI

struct ThemeSwitcherView<Content: View>: View {
    @ViewBuilder var content: Content
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    var body: some View {
        content
            .preferredColorScheme(appTheme.colorScheme)
    }
}
