import SwiftUI

struct ContentView: View {
    @State private var showSignOutAlert = false
    private let stats = [
        "Posts": "2,345",
        "Followers": "34.5K",
        "Following": "456"
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    AsyncImage(url: URL(string: "https://example.com/profile-image.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .frame(
                    width: 120,
                    height: 120
                )
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding(
                    .top,
                    20
                )
                
                VStack(spacing: 0) {
                    Text("Tony Stark")
                        .font(.title.bold())
                    
                    Text("Ironman")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                HStack(spacing: 80) {
                    ForEach(
                        Array(stats.keys),
                        id: \.self
                    ) { key in
                        StatsView(
                            value: stats[key]!,
                            label: key
                        )
                    }
                }
                .padding(.vertical)
                
                HStack(spacing: 15) {
                    Button("Follow") {
                        
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                    Button("Message") {
                        
                    }
                    .buttonStyle(SecondaryButtonStyle())
                }
                
                VStack(spacing: 0) {
                    NavigationLink {
                        Text("Settings View")
                    } label: {
                        SettingsRow(
                            icon: "gear",
                            title: "Settings"
                        )
                    }
                    
                    NavigationLink {
                        Text("Privacy View")
                    } label: {
                        SettingsRow(
                            icon: "lock.fill",
                            title: "Privacy"
                        )
                    }
                    
                    NavigationLink {
                        Text("Notifications View")
                    } label: {
                        SettingsRow(
                            icon: "bell.fill",
                            title: "Notifications"
                        )
                    }
                }
                .padding(.vertical)
            }
            .padding(.horizontal)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Button("Sign Out") {
                    showSignOutAlert = true
                }
                .buttonStyle(SignOutButtonStyle())
                .alert("Sign Out", isPresented: $showSignOutAlert) {
                    Button("Cancel", role: .cancel) {}
                    
                    Button("Sign Out", role: .destructive) {}
                } message: {
                    Text("Are you sure you want to sign out?")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
