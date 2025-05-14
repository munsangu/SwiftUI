import SwiftUI

struct ContentView: View {
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    var body: some View {
        NavigationStack {
            List {
                Picker("", selection: $appTheme) {
                    ForEach(
                        AppTheme.allCases,
                        id: \.rawValue
                    ) { theme in
                        Text(theme.rawValue)
                            .tag(theme)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Theme Switcher")
        }
    }
}

#Preview {
    ContentView()
}
