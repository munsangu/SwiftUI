import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = [
        Character(
            nameKey: "Ironman",
            descriptionKey: "iron_man_desc",
            imageName: "Ironman"),
        Character(
            nameKey: "CaptainAmerica",
            descriptionKey: "captain_america_desc",
            imageName: "CaptainAmerica"),
        Character(
            nameKey: "Thor",
            descriptionKey: "thor_desc",
            imageName: "Thor"),
        Character(
            nameKey: "Hulk",
            descriptionKey: "hulk_desc",
            imageName: "Hulk"),
        Character(
            nameKey: "BlackWidow",
            descriptionKey: "black_widow_desc",
            imageName: "BlackWidow"),
        Character(
            nameKey: "Loki",
            descriptionKey: "loki_desc",
            imageName: "Loki"),
        Character(
            nameKey: "Thanos",
            descriptionKey: "thanos_desc",
            imageName: "Thanos"),
        Character(
            nameKey: "Spiderman",
            descriptionKey: "spiderman_desc",
            imageName: "SpiderMan"),
        Character(
            nameKey: "Dr.Strange",
            descriptionKey: "dr_strange_desc",
            imageName: "DrStrange"),
        Character(
            nameKey: "Ultron",
            descriptionKey: "ultron_desc",
            imageName: "Ultron")
    ]
}
