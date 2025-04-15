import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(
                            .vertical,
                            2
                        )
                        .swipeActions {
                            Button(
                                "Delete",
                                role: .destructive
                            ) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle("Wish List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert(
                "Create a new wish",
                isPresented: $isAlertShowing
            ) {
                TextField(
                    "Enter a wish",
                    text: $title
                )
                
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wish List",
                        systemImage: "heart.circle",
                        description: Text("No wishes yet.\nAdd one to get started.")
                    )
                }
            }
        }
    }
}

#Preview("List with Sample Data") {
    let container = try! ModelContainer(
        for: Wish.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    container.mainContext.insert(Wish(title: "Master SwiftUI"))
    container.mainContext.insert(Wish(title: "Buy a new IPhone"))
    container.mainContext.insert(Wish(title: "Learn English for business"))
    container.mainContext.insert(Wish(title: "Travel to World"))
    container.mainContext.insert(Wish(title: "Make a positive impact"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(
            for: Wish.self,
            inMemory: true
        )
}
