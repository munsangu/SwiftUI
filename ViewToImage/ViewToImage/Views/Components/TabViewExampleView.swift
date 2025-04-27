import SwiftUI

struct TabViewExampleView: View {
    @ObservedObject var viewModel: SnapshotViewModel
    
    var body: some View {
        TabView {
            VStack {
                Text("Home Tab Content")
                    .font(.title)
                    .padding()
                
                Button("Take Snapshot") {
                    viewModel.takeSnapshot()
                }
                .buttonStyle(.borderedProminent)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            Text("Search Tab")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Text("Settings Tab")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .navigationTitle("TabView Example")
        .snapshot(trigger: viewModel.triggerSnapshot) { image in
            viewModel.setSnapshot(image)
        }
    }
}
