import SwiftUI

struct ContentView: View {
    @State private var config: DrawerConfig = .init()
    @State private var moveToCenter: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Move to Center")
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    Toggle("", isOn: $moveToCenter)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                if !moveToCenter {
                    Spacer(minLength: 0)
                }
                
                DrawerButton(
                    title: "Continue",
                    config: $config
                )
            }
            .padding(15)
            .navigationTitle("Alert Drawer")
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: moveToCenter)
        }
        .alertDrawer(
            config: $config,
            primaryTitle: "Continue",
            secondaryTitle: "Cancel") {
                return false
            } onSecondaryClick: {
                return true
            } content: {
                VStack(
                    alignment: .leading,
                    spacing: 15
                ) {
                    Image(systemName: "exclamationmark.circle")
                        .font(.largeTitle)
                        .foregroundStyle(.red)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    
                    Text("Are you sure?")
                        .font(.title2.bold())
                    
                    Text("You haven't backed up your waller yet. \nIf you remove it, you could lose access forever. We suggest tapping Cancel and backing up your wallet first with a valid recovery method.")
                        .foregroundStyle(.gray)
                        .fixedSize(
                            horizontal: false,
                            vertical: true
                        )
                        .frame(width: 300)
                }
            }

    }
}

#Preview {
    ContentView()
}
