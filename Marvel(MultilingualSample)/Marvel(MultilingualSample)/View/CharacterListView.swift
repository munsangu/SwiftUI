import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.characters) { character in
                NavigationLink {
                    CharacterDetailView(character: character)
                } label: {
                    HStack(spacing: 12) {
                        Image(character.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(
                                width: 50,
                                height: 50,
                                alignment: .top
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        Text(LocalizedStringKey(character.nameKey))
                            .font(.headline)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Marvel")
            .scrollIndicators(.hidden)
        }
    }
}

#Preview("🇺🇸 English") {
    CharacterListView()
        .environment(\.locale, Locale(identifier: "en"))
}

#Preview("🇰🇷 Korean") {
    CharacterListView()
        .environment(\.locale, Locale(identifier: "ko"))
}
