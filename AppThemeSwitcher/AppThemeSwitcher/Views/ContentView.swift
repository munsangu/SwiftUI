import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var scheme
    @StateObject private var viewModel = ThemeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        viewModel.toggleThemeSheet()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(viewModel.getPreferredColorScheme())
        .sheet(isPresented: $viewModel.showThemeSheet) {
            ThemeChangeView(viewModel: viewModel, scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        }
    }
}

#Preview {
    ContentView()
}
