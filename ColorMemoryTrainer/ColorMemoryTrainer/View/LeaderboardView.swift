import SwiftUI
import SwiftData

struct LeaderboardView: View {
    @Query(
        sort: \LeaderboardEntry.score,
        order: .reverse
    ) var entries: [LeaderboardEntry]

    var body: some View {
        VStack {
            Text("🏆 Leaderboard")
                .font(.title)

            List {
                ForEach(entries) { entry in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(entry.nickname)
                                .font(.headline)
                            
                            Text("Level \(entry.level)")
                                .font(.subheadline)
                        }
                        Spacer()
                        
                        VStack {
                            Text("Score: \(entry.score)")
                            
                            Text(entry.date.formatted())
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .padding()
    }
}
