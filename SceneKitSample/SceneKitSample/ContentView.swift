import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        SceneKitView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct SceneKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        scene.rootNode.addChildNode(cameraNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(0, 5, 5)
        scene.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        let cube = SCNBox(
            width: 1.0,
            height: 1.0,
            length: 1.0,
            chamferRadius: 0.1
        )
        let cubeNode = SCNNode(geometry: cube)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.systemBlue
        cube.materials = [material]
        scene.rootNode.addChildNode(cubeNode)
        
        let rotation = CABasicAnimation(keyPath: "rotation")
        rotation.toValue = NSValue(scnVector4: SCNVector4(x: 1, y: -1, z: 1, w: .pi * 2))
        rotation.duration = 5
        rotation.repeatCount = .infinity
        cubeNode.addAnimation(
                                rotation,
                                forKey: "rotation"
                             )
        
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = UIColor.black
        
        return sceneView
    }
    
    func updateUIView(
        _ uiView: SCNView,
        context: Context
    ) {
        
    }
}

#Preview {
    ContentView()
}
