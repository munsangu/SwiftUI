import SwiftUI

struct RestrictedTextField<Content: View>: View {
    var hint: String
    var characters: CharacterSet
    @Binding var value: String
    @ViewBuilder var content: (TextField<Text>, String) -> Content
    @State private var errorMessage: String = ""
    var body: some View {
        content(
            TextField(
                hint,
                text: $value
            ),
            errorMessage
        )
        .onChange(of: value) { oldValue, newValue in
            var messages: [String] = []

            let restrictedCharacters = newValue.unicodeScalars.filter { characters.contains($0) }
            if !restrictedCharacters.isEmpty {
                value.unicodeScalars.removeAll(where: { characters.contains($0) })
                messages.append("\(restrictedCharacters)")
            }

            if !newValue.contains("_") {
                messages.append("underscore required")
            }

            errorMessage = messages.joined(separator: ", ")
        }
    }
}
