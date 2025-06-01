import SwiftUI

struct DummyScrollContent: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 30) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.red.gradient)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.blue.gradient)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.green.gradient)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.yellow.gradient)
            }
            .frame(height: 60)
            
            VStack(
                alignment: .leading,
                spacing: 25
            ) {
                Text("Favorites")
                    .foregroundStyle(.gray)
                
                Text("Start adding your favorites\nto show up here!")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .padding(
                .top,
                30
            )
        }
        .padding(
            .horizontal,
            30
        )
        .padding(.vertical, 20
        )
    }
}
