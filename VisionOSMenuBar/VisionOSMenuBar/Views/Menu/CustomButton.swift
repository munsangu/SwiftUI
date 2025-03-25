import SwiftUI

struct CustomButton: View {
    let title: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 13))
                
                Spacer(minLength: 0)
                
                Image(systemName: image)
                    .frame(width: 20)
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    CustomButton(title: "Test Button", image: "doc") {}
}
