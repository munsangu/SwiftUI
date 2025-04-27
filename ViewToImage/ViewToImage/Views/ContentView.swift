import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SnapshotViewModel()
    
    var body: some View {
        NavigationStack {
                VStack(
                    alignment: .leading,
                    spacing: 10
                ) {
                    NavigationLink(destination: NormalExampleView(viewModel: viewModel)) {
                        Text("Normal View Example")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                    }
                    
                    NavigationLink(destination: NavigationExampleView(viewModel: viewModel)) {
                        Text("Navigation Stack Example")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                    }
                    
                    NavigationLink(destination: TabViewExampleView(viewModel: viewModel)) {
                        Text("TabView Example")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 50)
                .navigationTitle("View Snapshot")
            
                Spacer()
            }
            .padding()
            .overlay(SnapshotOverlayView(viewModel: viewModel))
        }
}

#Preview {
    ContentView()
}
