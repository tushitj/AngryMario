//
//  Hero.swift
//  project5
//
//  Created by Tushit Jain on 3/18/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import Foundation
import SpriteKit

class Hero : SKSpriteNode{
    class Hero : SKSpriteNode {
        var body : SKSpriteNode!
        var arm : SKSpriteNode!
        var leftFoot : SKSpriteNode!
        var rightFoot : SKSpriteNode!
        var isUpsideDown = false;
        
        
        //override init(){
        init() {
            super.init(texture: nil , color:UIColor.clear , size: CGSize(width: 32, height: 44))
            loadApp()
            //loadPhysicsBody(size:CGSize(width: 32, height: 25))
            
            
        }
        
        func loadApp(){
            body = SKSpriteNode(color: UIColor.black, size: CGSize(width: self.frame.size.width, height: 40))
            
            //body = SKSpriteNode(imageNamed: "bee.png")
            body.size = CGSize(width: self.frame.size.width, height: 25)
            body.position = CGPoint(x: 0, y: 3.5)
            addChild(body)
            // let skinColor = UIColor(red: 207/255, green: 193/255, blue: 168/255, alpha: 1.0)
            // let face = SKSpriteNode(color: skinColor, size: CGSize(width:self.frame.size.width , height:12))
            //face.position = CGPoint(x: 0, y: 6)
            //body.addChild(face)
            
        }
//        func loadPhysicsBody(size : CGSize){
//            physicsBody = SKPhysicsBody(rectangleOf: size)
//            physicsBody?.categoryBitMask = heroCat
//            physicsBody?.contactTestBitMask = wallCat
//            physicsBody?.affectedByGravity = false
//            
//        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        func breathe(){
            let breatheOut = SKAction.moveBy(x: 0, y: -2, duration: 0.1)
            let breatheIn = SKAction.moveBy(x: 0, y: 2, duration: 0.1)
            let breathe = SKAction.sequence([breatheOut,breatheIn])
            body.run(SKAction.repeatForever(breathe))
            
            
        }
//        func flip(){
//            isUpsideDown = !isUpsideDown
//            var scale: CGFloat
//            if(isUpsideDown){
//                scale = -1.0
//            }
//            else{
//                scale = 1.0
//            }
//            
//            let translate = SKAction.moveBy(x: 0, y: scale*(size.height + 20), duration: 0.5)
//            let flip = SKAction.scaleY(to: scale, duration: 0.5)
//            run(translate)
//            run(flip)
//       }
        func stop(){
            body.removeAllActions()
        }
        
    }
}
