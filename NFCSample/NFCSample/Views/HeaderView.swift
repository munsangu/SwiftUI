import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image(systemName: "wave.3.right.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("NFC Tag Reader")
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    HeaderView()
}
