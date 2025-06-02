import SwiftUI
import SceneKit

struct BrickView: View {
    var brickWidth: CGFloat
    var brickHeight: CGFloat
    var brickLength: CGFloat
    var studRadius: CGFloat
    var studHeight: CGFloat
    var brickColor: UIColor
    var body: some View {
        SceneView(
            scene: buildScene(),
            options: [.allowsCameraControl]
        )
        .id("\(brickWidth)-\(brickHeight)-\(brickLength)-\(studRadius)-\(studHeight)-\(brickColor)")
        .edgesIgnoringSafeArea(.all)
    }
    
    func buildScene() -> SCNScene {
        let scene = SCNScene()
        scene.background.contents = UIColor.darkGray
        
        let brickBox = SCNBox(
            width: brickWidth,
            height: brickHeight,
            length: brickLength,
            chamferRadius: 0.05
        )
        let brickNode = SCNNode(geometry: brickBox)
        brickNode.geometry?.firstMaterial?.diffuse.contents = brickColor
        brickNode.position = SCNVector3(
            0,
            Float(brickHeight / 2),
            0
        )
        scene.rootNode.addChildNode(brickNode)
        
        let studCountX = Int(brickWidth)
        let studCountZ = Int(brickLength)
        let studYPosition = Float(brickHeight + studHeight / 2)
        
        let offsetX = brickWidth / CGFloat(studCountX)
        let offsetZ = brickLength / CGFloat(studCountZ)
        
        for i in 0..<studCountX {
            let x = -brickWidth / 2 + offsetX / 2 + CGFloat(i) * offsetX
            for j in 0..<studCountZ {
                let z = -brickLength / 2 + offsetZ / 2 + CGFloat(j) * offsetZ
                let studGeometry = SCNCylinder(radius: studRadius, height: studHeight)
                let studNode = SCNNode(geometry: studGeometry)
                studNode.geometry?.firstMaterial?.diffuse.contents = brickColor
                studNode.position = SCNVector3(
                    Float(x),
                    studYPosition,
                    Float(z)
                )
                scene.rootNode.addChildNode(studNode)
            }
        }
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 3, 6)
        cameraNode.look(
            at: SCNVector3(
                0,
                Float(brickHeight / 2),
                0
            )
        )
        scene.rootNode.addChildNode(cameraNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor(
            white: 0.4,
            alpha: 1.0
        )
        scene.rootNode.addChildNode(ambientLightNode)
        
        let directionalLightNode = SCNNode()
        directionalLightNode.light = SCNLight()
        directionalLightNode.light?.type = .directional
        directionalLightNode.light?.color = UIColor.white
        directionalLightNode.eulerAngles = SCNVector3(
            -Float.pi / 3,
             0,
             0
        )
        scene.rootNode.addChildNode(directionalLightNode)

        return scene
    }
}

#Preview {
    BrickView(
        brickWidth: 2.0,
        brickHeight: 0.5,
        brickLength: 2.0,
        studRadius: 0.15,
        studHeight: 0.1,
        brickColor: .red
    )
}
