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
var left : SKSpriteNode = SKSpriteNode()
var right : SKSpriteNode = SKSpriteNode()
var top : SKSpriteNode = SKSpriteNode()
var bottom : SKSpriteNode = SKSpriteNode()
var hero : SKSpriteNode = SKSpriteNode()
var ball : SKShapeNode = SKShapeNode()
var moveball = 1;
var leftCategory : UInt32 = 0
var ballCategory : UInt32 = 0b1
//var i = 0

var gameOver = false;


var val = 0
class GameScene: SKScene, SKPhysicsContactDelegate {
 
    let motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
       
        backgroundColor = UIColor.blue
        loadHero()
        loadWalls()
        loadBall()
        
        
        //Motion Manager. Hero Left Right Code
        motionManager.startAccelerometerUpdates()
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.main ) {
            (data, error) in
        guard let data = self.motionManager.accelerometerData else { return }
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
            hero.physicsBody?.applyImpulse(CGVector(dx:-10 * CGFloat(data.acceleration.y), dy:0))
        } else {
            hero.physicsBody?.applyImpulse(CGVector(dx: 10 * CGFloat(data.acceleration.y),dy:  0))
        }
        }
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameScene.jumpBall), userInfo: nil, repeats: true)
        
        physicsWorld.contactDelegate = self
        
        
    }
    
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
    
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        //gets called automatically when two objects end the contact with each other.
    }
    
    func loadHero(){
        hero = SKSpriteNode(imageNamed: "hero.png")
//        hero.position = CGPoint(x: self.frame.midX, y:self.frame.midY)
        hero.position = CGPoint(x: self.frame.midX, y:bottom.size.height-100)
        
        hero.setScale(0.2)
        hero.texture?.filteringMode = .nearest
        hero.physicsBody = SKPhysicsBody(circleOfRadius: hero.size.width / 2) // You have to divide by 2 when using circleOfRadius to get proper size in relation to the sprite
        hero.physicsBody?.allowsRotation = false
        hero.physicsBody?.affectedByGravity = false
        let yConstraint = SKConstraint.positionY(SKRange(constantValue: bottom.size.height-100))
        hero.constraints = [yConstraint]
        addChild(hero)

    }
    
    func loadBall(){
      //  let ballColor = UIColor.red
        let ballRad : CGFloat = 15.0
        ball.position = CGPoint(x:self.frame.midX+1 , y: self.frame.midY+40)
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
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 10)
        if(moveball == 0){
            ball.physicsBody!.applyImpulse(CGVector(dx:3, dy:20))
        }
        else if(moveball == 1){
            ball.physicsBody!.applyImpulse(CGVector(dx:-3, dy:20))
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        jumpBall()
    }
    

    
    override func update(_ currentTime: TimeInterval) {
        
        if(ball.position == hero.position){
            gameOver = true;
        }
        
        if(ball.position.x < -self.frame.size.width/2+25){
            moveball = 0;
        }
        else if(ball.position.x > self.frame.size.width/2-25){
            moveball = 1;
        }
        
        if(gameOver == true){
            print("Game is over")
        }
    }
    
    
}
    

