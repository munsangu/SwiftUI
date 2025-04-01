import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published var showThemeSheet = false
    @AppStorage("userTheme") var userTheme: Theme = .systemDefault
    
    func toggleThemeSheet() {
        showThemeSheet.toggle()
    }
    
    func selectTheme(_ theme: Theme) {
        userTheme = theme
    }
    
    func getPreferredColorScheme() -> ColorScheme? {
        return userTheme.colorScheme
    }
    
    func getThemeColor(for scheme: ColorScheme) -> Color {
        return userTheme.color(scheme)
    }
    
    func getCircleOffset(for scheme: ColorScheme) -> CGSize {
        let isDark = scheme == .dark
        return CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : -150)
    }
}
