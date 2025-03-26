import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                
            Spacer(minLength: 0)
        
            Button("", systemImage: "airplayvideo") {}
            
            Button("", systemImage: "bell") {}
            
            Button("", systemImage: "magnifyingglass") {}
        }
        .font(.title2)
        .foregroundStyle(.primary)
        .padding(.horizontal, 15)
    }
}

#Preview {
    HeaderView()
        .frame(height: 57 + 47) 
        .background(.background)
        .preferredColorScheme(.dark)
}
