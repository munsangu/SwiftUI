import SwiftUI
import SpriteKit

class SmokeScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        print("didMove called")
        
        let smoke = SKEmitterNode()
        smoke.particleTexture = SKTexture(imageNamed: "smokeParticle")
        smoke.particleBirthRate = 20
        smoke.particleLifetime = 2.0
        smoke.emissionAngle = .pi / 2
        smoke.particleSpeed = 50
        smoke.particleSpeedRange = 25
        smoke.particleAlpha = 0.6
        smoke.particleAlphaSpeed = -0.3
        smoke.particleScale = 0.5
        smoke.particleScaleSpeed = 0.6
        smoke.position = CGPoint(
            x: size.width / 2,
            y: size.height * 0.1
        )
        addChild(smoke)
        smoke.resetSimulation()
    }
}
