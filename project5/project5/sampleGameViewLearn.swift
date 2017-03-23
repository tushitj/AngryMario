//
//  sampleGameViewLearn.swift
//  project5
//
//  Created by Tushit Jain on 3/23/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

//
//  GameScene.swift
//  test
//
//  Created by Tushit Jain on 3/23/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var cat : SKSpriteNode!
var bottom1 : SKSpriteNode!
class sampleGameViewLearn: SKScene, SKPhysicsContactDelegate {
    
    let catCategory: UInt32 = 1 << 0
    let treeCategory: UInt32 = 1 << 1
    let worldCategory: UInt32 = 1 << 1
    let crowCategory : UInt32 = 0 << 0
    let contact2Category:UInt32 = 0 << 2
    
    override func didMove(to view: SKView) {
        cat = SKSpriteNode(color: UIColor.blue, size: CGSize(width:20 ,height:20))
        cat.physicsBody = SKPhysicsBody(rectangleOf: cat.size)
        cat.position = CGPoint(x: self.frame.size.width / 2.2, y: self.frame.size.height / 7.0 )
        cat.physicsBody?.categoryBitMask = catCategory
        cat.physicsBody?.collisionBitMask = crowCategory | worldCategory
        cat.physicsBody?.contactTestBitMask = crowCategory | contact2Category
        addChild(cat)
        
        
        bottom1 = SKSpriteNode(color : .green , size : CGSize(width: self.frame.size.width,height: 150))
        bottom1.physicsBody = SKPhysicsBody(rectangleOf: bottom.size)
        bottom1.physicsBody?.isDynamic = false;
        bottom1.position = CGPoint(x:0, y:-205 )
        addChild(bottom1)
        
        
        let dummy = SKNode()
        dummy.position = CGPoint(x:100, y:100)
        dummy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:25 ,height:25))
        dummy.physicsBody!.isDynamic = false
        dummy.physicsBody?.categoryBitMask = worldCategory
        dummy.physicsBody?.collisionBitMask = 0
        dummy.physicsBody?.contactTestBitMask = 0
        addChild(dummy)
        
    }
    
    
    func spawnTrees() {
        let treeP = SKNode()
        treeP.position = CGPoint( x:50, y:0 );
        treeP.zPosition = -10;
        let height = UInt32( self.frame.size.height / 4 )
        let y = arc4random() % height;
        let tree1 = SKSpriteNode(color: UIColor.green, size: CGSize(width:30 ,height:30 ))
        tree1.position = CGPoint(x: 0.0, y:CGFloat(y))
        tree1.physicsBody = SKPhysicsBody(rectangleOf: tree1.size)
        tree1.physicsBody?.isDynamic = false
        tree1.physicsBody?.categoryBitMask = treeCategory;
        tree1.physicsBody?.collisionBitMask = 0
        tree1.physicsBody?.contactTestBitMask = 0
        addChild(tree1)
        
        // treeP.runAction(moveAndRemoveTrees)
        
        //addChild(treeP)
        
    }
    
    // all of touchesBegan
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cat.physicsBody?.velocity = CGVector(dx: 0, dy: 20)
        cat.physicsBody!.applyImpulse(CGVector(dx:0, dy:20))
    }
}
