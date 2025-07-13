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
                            Text("Level \(entry.level)")
                                .font(.headline)
                            
                            Text(entry.date.formatted(
                                    date: .abbreviated,
                                    time: .shortened
                                )
                            )
                            .font(.caption)
                            .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text("Score: \(entry.score)")
                    }
                }
            }
        }
        .padding()
    }
}
