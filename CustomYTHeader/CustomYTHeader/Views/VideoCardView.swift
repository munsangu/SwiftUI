import SwiftUI

struct VideoCardView: View {
    let video: Video
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {
            RoundedRectangle(cornerRadius: 6)
                .frame(height: 220)
                // AsyncImage(url: URL(string: video.thumbnailURL)) { image in
                //     image.resizable().aspectRatio(contentMode: .fill)
                // } placeholder: {
                //     Rectangle().foregroundStyle(.tertiary)
                // }
                // .frame(height: 220)
                // .clipShape(RoundedRectangle(cornerRadius: 6))
            
            HStack(spacing: 10) {
                Circle()
                    .frame(
                        width: 45,
                        height: 45
                    )
                    // AsyncImage(url: URL(string: video.channelAvatarURL)) { image in
                    //     image.resizable().aspectRatio(contentMode: .fill)
                    // } placeholder: {
                    //     Circle().foregroundStyle(.tertiary)
                    // }
                    // .frame(width: 45, height: 45)
                    // .clipShape(Circle())
                
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    Rectangle()
                        .frame(height: 10)
                        // Text(video.title)
                        //     .font(.subheadline)
                        //     .fontWeight(.semibold)
                        //     .lineLimit(2)
                    
                    HStack(spacing: 10) {
                        Rectangle()
                            .frame(width: 100)
                            // Text(video.channelName)
                        
                        Rectangle()
                            .frame(width: 80)
                            // Text(video.viewCount)
                        
                        Rectangle()
                            .frame(width: 60)
                            // Text(video.uploadedTime)
                    }
                    .frame(height: 10)
                    // HStack(spacing: 4) {
                    //     Text(video.channelName)
                    //     Text("•")
                    //     Text(video.viewCount)
                    //     Text("•")
                    //     Text(video.uploadedTime)
                    // }
                    // .font(.caption)
                    // .foregroundStyle(.secondary)
                }
            }
        }
        .foregroundStyle(.tertiary)
    }
}

#Preview {
    VideoCardView(video: Video())
        .preferredColorScheme(.dark)
        .padding()
}
