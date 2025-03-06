import SwiftUI

struct CharacterView: View {
    let index: Int
    let value: String
    let style: TextFieldStyle
    let state: TypingState
    let isActive: Bool
    
    var body: some View {
        Group {
            if style == .roundedBorder {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1.2)
            } else {
                Rectangle()
                    .fill(borderColor)
                    .frame(height: 1)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(
            width: style == .roundedBorder ? 50 : 40,
            height: 50
        )
        .overlay {
            let stringValue = string
            if stringValue != "" {
                Text(stringValue)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .transition(.blurReplace)
            }
        }
    }
    
    private var string: String {
        if value.count > index {
            let startIndex = value.startIndex
            let stringIndex = value.index(startIndex, offsetBy: index)
            return String(value[stringIndex])
        }
        return ""
    }
    
    private var borderColor: Color {
        switch state {
        case .typing:
            value.count == index && isActive ?
                Color.primary :
                .gray
        case .valid: .green
        case .invalid: .red
        }
    }
}
