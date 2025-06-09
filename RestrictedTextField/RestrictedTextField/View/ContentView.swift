import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                RestrictedTextField(
                    hint: "tony_stark",
                    characters: characters,
                    value: $userName
                ) { textfield, errorMessage in
                    ZStack(alignment: .bottomLeading) {
                        let isEmpty = errorMessage.isEmpty
                        var errorMessageMessage: String {
                            if errorMessage.contains("underscore required") {
                                return "Username must include at least one underscore (_)"
                            } else {
                                return "Username contains invalid \(errorMessage) characters!"
                            }
                        }
                        
                        textfield
                            .padding(
                                .horizontal,
                                15
                            )
                            .padding(
                                .vertical,
                                12
                            )
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray.opacity(0.4))
                            }
                        
                        if !isEmpty {
                            Text(errorMessageMessage)
                                .font(.caption2)
                                .foregroundStyle(.red)
                                .offset(y: 25)
                        }
                    }
                    .animation(
                        .smooth,
                        value: errorMessage
                    )
                }
            }
            .padding(15)
            .navigationTitle("Restricted TextField")
        }
    }
    
    var characters: CharacterSet {
        var chars = CharacterSet.letters.inverted
        chars.remove("_")
        return chars
    }
}

#Preview {
    ContentView()
}
