import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Example 1") {
                    Example1View()
                }
                
                NavigationLink("Example 2") {
                    Example2View()
                        .navigationBarBackButtonHidden()
                }
            }
            .navigationTitle("Resizable Header")
        }
    }
}

#Preview {
    ContentView()
}
