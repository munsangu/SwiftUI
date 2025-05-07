import SwiftUI

struct ContentView: View {
    @State private var heroes: [String] = []
//    @State private var heroes = ["Ironman", "Captain", "Thor", "Hurk", "Deadpool", "Antman", "SpiderMan"]
    @State private var searchTerm: String = ""
    
    var filteredHeroes: [String] {
        guard !searchTerm.isEmpty else { return heroes }
        return heroes.filter { $0.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if heroes.isEmpty {
//                    ContentUnavailableView(
//                        "No Heroes",
//                        systemImage: "person.slash",
//                        description: Text("You need to create a hero to see here.")
//                    )
                    
                    ContentUnavailableView {
                        VStack(spacing: 20) {
                            Image("Thanos")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.circle)
                            
                            Text("No Heroes")
                                .bold()
                        }
                    } description: {
                        Text("Tap the button below to create a hero.")
                            .italic()
                            .foregroundStyle(.teal)
                    } actions: {
                        Button("Add Hero") {
                            // Add here logic
                        }
                        .buttonStyle(.bordered)
                    }

                } else {
                    List(
                        filteredHeroes,
                        id: \.self
                    ) { hero in
                        Text(hero)
                    }
                    .searchable(text: $searchTerm)
                    .overlay {
                        if filteredHeroes.isEmpty {
                            ContentUnavailableView.search(text: searchTerm)
                        }
                    }
                }
            }
            .navigationTitle("Heroes")
        }
    }
}

#Preview {
    ContentView()
}
