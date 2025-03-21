import UIKit

class ImageProcessor {
    func generateParticles(
        from image: UIImage,
        isReintegrating: Bool,
        maxGridSize: Int = 1100
    ) async -> [SnapParticle] {
        var particles: [SnapParticle] = []
        let size = image.size
        let width = size.width
        let height = size.height
        
        var gridSize: Int = 1
        var rows = Int(height) / gridSize
        var columns = Int(width) / gridSize
        
        while (rows * columns) >= maxGridSize {
            gridSize += 1
            rows = Int(width) / gridSize
            columns = Int(height) / gridSize
        }
        
        for row in 0...rows {
            for column in 0...columns {
                let positionX = column * gridSize
                let positionY = row * gridSize
                
                let cropRect = CGRect(
                    x: positionX,
                    y: positionY,
                    width: gridSize,
                    height: gridSize
                )
                let croppedImage = cropImage(image, rect: cropRect)
                
                let randomOffset = isReintegrating ?
                    CGSize(width: CGFloat.random(in: -150...150), height: CGFloat.random(in: -150...150)) :
                    nil
                
                particles.append(
                    .init(
                        particleImage: croppedImage,
                        particleOffset: .init(width: positionX, height: positionY),
                        initialRandomOffset: randomOffset
                    )
                )
            }
        }
        
        return particles
    }
    
    func cropImage(
        _ image: UIImage,
        rect: CGRect
    ) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(
            size: rect.size,
            format: format
        )
        return renderer.image { ctx in
            ctx.cgContext.interpolationQuality = .low
            image.draw(at: .init(
                    x: -rect.origin.x,
                    y: -rect.origin.y
                )
            )
        }
    }
}
