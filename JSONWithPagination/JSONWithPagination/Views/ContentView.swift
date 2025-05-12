import SwiftUI

struct ContentView: View {
    @State private var photos: [Photo] = []
    @State private var page: Int = 1
    @State private var lastFetchedPage: Int = 1
    @State private var isLoading: Bool = false
    @State private var maxPage: Int = 5
    @State private var activePhotoID: String?
    @State private var lastPhotoID: String?
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(
                    columns: Array(
                        repeating: GridItem(spacing: 10),
                        count: 3
                    ),
                    spacing: 10
                ) {
                    ForEach(photos) { photo in
                        PhotoCardView(photo: photo)
                    }
                }
                .overlay(alignment: .bottom) {
                    if isLoading {
                        ProgressView()
                            .offset(y: 30)
                    }
                }
                .padding(15)
                .padding(
                    .bottom,
                    15
                )
                .scrollTargetLayout()
            }
            .scrollPosition(
                id: $activePhotoID,
                anchor: .bottomTrailing
            )
            .onChange(of: activePhotoID, { oldValue, newValue in
                if newValue == lastPhotoID,
                    !isLoading,
                   page != maxPage
                {
                    page += 1
                    fetchPhotos()
                }
            })
            .onAppear {
                if photos.isEmpty { fetchPhotos() }
            }
            .navigationTitle("JSON Parsing")
        }
    }
    
    func fetchPhotos() {
        Task {
            do {
                if let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=30") {
                    isLoading = true
                    
                    let session = URLSession(configuration: .default)
                    let jsonData = try await session.data(from: url).0
                    let photos = try JSONDecoder().decode([Photo].self, from: jsonData)
                    await MainActor.run {
                        if photos.isEmpty {
                            page = lastFetchedPage
                        } else {
                            self.photos.append(contentsOf: photos)
                            lastPhotoID = self.photos.last?.id
                            lastFetchedPage = page
                        }
                        
                        isLoading = false
                    }
                }
            } catch {
                isLoading = false
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
