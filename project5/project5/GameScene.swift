//
//  GameScene.swift
//  project5
//
//  Created by Tushit Jain on 3/15/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

//var hero : Hero!
var left : SKSpriteNode!
var right : SKSpriteNode!
var top : SKSpriteNode!
var bottom : SKSpriteNode!
var hero : SKSpriteNode!
var ball : SKShapeNode!



var val = 0
class GameScene: SKScene {
 
    let motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        //manager.startGyroUpdates()
        //manager.gyroUpdateInterval = 0.1
//        
//        if let error = error { // Might as well handle the optional error as well
//            print(error.localizedDescription)
//            return
//        }
        
        
        
        
//        manager.startGyroUpdates(to: OperationQueue.main){
//            (data,error) in
//           // self.physicsWorld.gravity = CGVector(x:data?.acceleration.x,y: data?.acceleration.y)
//            if(CGFloat((data?.rotationRate.y)!) > 0.0){
//                hero.position.x += 2.0
//                
//            }
//            else if(CGFloat((data?.rotationRate.y)!) < 0.0){
//                hero.position.x -= 2.0
//                
//            }
        
//        }
        
        
        backgroundColor = UIColor.blue
        loadWalls()
        loadBall()
        
       
        //backgroundColor = UIColor(red: 150/250, green: 200/250, blue: 244/255, alpha: 1.90)
        //hero = SKSpriteNode(color: UIColor.black ,size:CGSize(width:20 , height: 50))
        //hero.position = CGPoint(x:20 , y :-175 )
        //addChild(hero)
        
        
        hero = SKSpriteNode(imageNamed: "hero.png")
        hero.position = CGPoint(x: self.frame.midX, y:self.frame.midY )
        
        hero.setScale(0.3)
        hero.texture?.filteringMode = .nearest
        hero.physicsBody = SKPhysicsBody(circleOfRadius: hero.size.width / 2) // You have to divide by 2 when using circleOfRadius to get proper size in relation to the sprite
        hero.physicsBody?.allowsRotation = false
        hero.physicsBody?.affectedByGravity = false
        addChild(hero)
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main ) {
            (data, error) in
        guard let data = self.motionManager.accelerometerData else { return }
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
           // hero.physicsBody?.applyForce(CGVector(dx:-500 * CGFloat(data.acceleration.y), dy:0))
            hero.physicsBody?.applyImpulse(CGVector(dx:-10 * CGFloat(data.acceleration.y), dy:0))
        } else {
            //hero.physicsBody?.applyForce(CGVector(dx: 500 * CGFloat(data.acceleration.y),dy:  0))
            hero.physicsBody?.applyImpulse(CGVector(dx: 10 * CGFloat(data.acceleration.y),dy:  0))
        }
        }
        
        
//        buttonDirLeft = SKSpriteNode(color: UIColor.black ,size:CGSize(width:20 , height: 20))
//        buttonDirLeft.position = CGPoint(x: -320, y: -180)
//        buttonDirLeft.setScale(2.0)
//        buttonDirLeft.alpha = 0.2
//        self.addChild(buttonDirLeft)
//        
//        
//        buttonDirRight = SKSpriteNode(color: UIColor.black ,size:CGSize(width:20 , height: 20))
//        buttonDirRight.position = CGPoint(x: -260, y: -180)
//        buttonDirRight.setScale(2.0)
//        buttonDirRight.alpha = 0.2
//        self.addChild(buttonDirRight)
        
        
    }
    func loadBall(){
      //  let ballColor = UIColor.red
        let ballRad : CGFloat = 15.0
        
        ball = SKShapeNode(circleOfRadius: ballRad)
        ball.fillColor = UIColor.red
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ballRad)
        ball.physicsBody?.isDynamic = true;
        ball.physicsBody?.restitution = 0.7
        addChild(ball)
        
        
    }
    
    func loadWalls(){
        let wallColor = UIColor.white
        let wallWidth : CGFloat = 20.0
        
        left = SKSpriteNode(color: wallColor, size: CGSize(width: wallWidth, height: self.frame.size.height))
        left.physicsBody = SKPhysicsBody(rectangleOf: left.size)
        left.physicsBody?.isDynamic = false;
        left.position = CGPoint(x: -self.frame.size.width/2, y: 0)
        addChild(left)
        
        
        right = left.copy() as! SKSpriteNode
        right.position = CGPoint(x: self.frame.size.width/2, y: 0)
        addChild(right)
        
        
        top = SKSpriteNode(color : wallColor , size : CGSize(width: self.frame.size.width,height: wallWidth))
        top.physicsBody = SKPhysicsBody(rectangleOf: top.size)
        top.physicsBody?.isDynamic = false;
        top.position = CGPoint(x: 0, y:210 )
        addChild(top)
        
        bottom = SKSpriteNode(color : .green , size : CGSize(width: self.frame.size.width,height: 150))
        bottom.physicsBody = SKPhysicsBody(rectangleOf: bottom.size)
        bottom.physicsBody?.isDynamic = false;
        bottom.position = CGPoint(x:0, y:-205 )
        addChild(bottom)
        
    }
    
    func jumpBall(){
        ball.physicsBody?.applyImpulse(<#T##impulse: CGVector##CGVector#>)
    }
}
    

