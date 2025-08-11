import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.black
        
        for _ in 0..<20 {
            let randomBox = createRandomBox()
            scene.rootNode.addChildNode(randomBox)
        }
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(
            x: 0,
            y: 0,
            z: 15
        )
        scene.rootNode.addChildNode(cameraNode)
        
        return sceneView
    }
    
    func updateUIView(
        _ uiView: SCNView,
        context: Context
    ) {
        
    }
    
    private func createRandomBox() -> SCNNode {
        let width = CGFloat.random(in: 0.5...1.5)
        let height = CGFloat.random(in: 0.5...1.5)
        let length = CGFloat.random(in: 0.5...1.5)
        
        let box = SCNBox(
            width: width,
            height: height,
            length: length,
            chamferRadius: 0.1
        )
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.init(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1
        )
        box.materials = [material]
        
        let node = SCNNode(geometry: box)
        node.position = SCNVector3(
            x: Float.random(in: -5...5),
            y: Float.random(in: -5...5),
            z: Float.random(in: -5...5)
        )
        
        return node
    }
}
