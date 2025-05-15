import SpriteKit

class MagicScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)

        if let magic = SKEmitterNode(fileNamed: "Magic.sks") {
            magic.position = location
            addChild(magic)

            let wait = SKAction.wait(forDuration: 2.0)
            let remove = SKAction.removeFromParent()
            magic.run(SKAction.sequence([wait, remove]))
        }
    }
}
