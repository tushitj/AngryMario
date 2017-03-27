//
//  GameScene.swift
//  project5
//
//  Created by Tushit Jain on 3/26/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var duck: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        duck = childNode(withName: "duck") as! SKSpriteNode
        duck.physicsBody?.affectedByGravity = false;
        
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first{
            let touchLocation = touch.location(in: self)
            let touchedWhere = nodes(at: touchLocation)
            
            if !touchedWhere.isEmpty {
                for node in touchedWhere {
                    if let sprite = node as? SKSpriteNode {
                        if sprite == duck {
                            duck.position = touchLocation
                        }
                    }
                }
            }
        }
    }
    
}
