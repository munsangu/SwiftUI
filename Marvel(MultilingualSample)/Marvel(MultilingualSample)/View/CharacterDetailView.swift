import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 16) {
                    Image(character.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height * 0.8
                        )
                        .clipped()
                    
                    Text(LocalizedStringKey(character.nameKey))
                        .font(.largeTitle)
                        .padding(.top)

                    Text(LocalizedStringKey(character.descriptionKey))
                        .font(.body)
                        .padding()
                }
            }
        }
        .navigationTitle(LocalizedStringKey(character.nameKey))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CharacterDetailView(character: Character(
        nameKey: "Ironman",
        descriptionKey: "iron_man_desc",
        imageName: "Ironman"
    ))
}
