import SwiftUI
import SwiftData
import AppIntents

@Model
class Memory {
    var caption: String
    var date: Date
    @Attribute(.externalStorage)
    var imageData: Data
    
    init(
        caption: String,
        date: Date = .now,
        imageData: Data
    ) {
        self.caption = caption
        self.date = date
        self.imageData = imageData
    }
    
    var uiImage: UIImage? {
        .init(data: imageData)
    }
    
}

struct ContentView: View {
    @Query(
        sort: [.init(\Memory.date, order: .reverse)],
        animation: .smooth
    )
    var memories: [Memory]
    var body: some View {
        NavigationStack {
            List {
                ForEach(memories) { memory in
                    Section(memory.caption) {
                        if let uiImage = memory.uiImage {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Memories")
            .overlay {
                if memories.isEmpty {
                    VStack {
                        Text("No memories yet.")
                            .font(.headline)
                        Text("Tap the plus button to add your first memory.")
                            .foregroundStyle(.secondary)
                    }
                    .padding(15)
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}

struct AddMemoryIntent: AppIntent {
    static var title: LocalizedStringResource = "Add new memory"
    
    @Parameter(
        title: .init(stringLiteral: "Choose a image"),
        description: "Memory to be added",
        supportedContentTypes: [.image],
        inputConnectionBehavior: .connectToPreviousIntentResult
    ) var imageFile: IntentFile
    
    @Parameter(title: "Caption") var caption: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let container = try ModelContainer(for: Memory.self)
        let context = ModelContext(container)
        
        let imageData = try await imageFile.data(contentType: .image)
        let memory = Memory(
            caption: caption,
            imageData: imageData
        )
        
        context.insert(memory)
        try context.save()
        
        return .result(dialog: "Memory added successfully!")
    }
}

struct AddMemoryShortcut: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AddMemoryIntent(),
            phrases: ["Create a new\(.applicationName) memory"],
            shortTitle: "Create new memory",
            systemImageName: "memories"
        )
    }
}
