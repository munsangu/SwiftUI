import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Permission Sheet")
        }
        .permissionSheet([
            .location,
            .camera,
            .microphone,
            .photoLibrary
        ])
    }
}

#Preview {
    ContentView()
}
