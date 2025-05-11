import SwiftUI

struct DownsizedImageView<Content: View>: View {
    var image: UIImage?
    var size: CGSize
    @ViewBuilder var content: (Image) -> Content
    @State private var downsizedImageView: Image?
    var body: some View {
        ZStack {
            if let downsizedImageView {
                content(downsizedImageView)
            } else {
                ProgressView()
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            }
        }
        .onAppear {
            guard downsizedImageView == nil else { return }
            createDownsizedImage(image)
        }
        .onChange(of: image) { oldValue, newValue in
            guard oldValue != newValue else { return }
            createDownsizedImage(newValue)
        }
    }
    
    private func createDownsizedImage(_ image: UIImage?) {
        guard let image else { return }
        let aspectSize = image.size.aspectFit(size)
        Task.detached(priority: .high) {
            let renderer = UIGraphicsImageRenderer(size: aspectSize)
            let resizedImage = renderer.image { ctx in
                image.draw(
                    in: .init(
                        origin: .zero,
                        size: aspectSize
                    )
                )
            }
            
            await MainActor.run {
                downsizedImageView = .init(uiImage: resizedImage)
            }
        }
    }
}
