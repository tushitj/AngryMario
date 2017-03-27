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
    var hasGone = false
    var originalDuckPos : CGPoint!
    override func didMove(to view: SKView) {
        duck = childNode(withName: "duck") as! SKSpriteNode
       // duck.physicsBody?.affectedByGravity = false;
        originalDuckPos = duck.position
        
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !hasGone {
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !hasGone {
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
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !hasGone{
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchedWhere = nodes(at: touchLocation)
                
                if !touchedWhere.isEmpty {
                    for node in touchedWhere {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == duck {
                               let dx = -(touchLocation.x - originalDuckPos.x)
                                let dy = -(touchLocation.y - originalDuckPos.y)
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                duck.physicsBody?.affectedByGravity = true
                                duck.physicsBody?.applyImpulse(impulse)
                                hasGone = true
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
}
