//
//  GameScene.swift
//  Group4Hackathon
//
//  Created by Reed Carson on 6/26/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import SpriteKit


var increaseX: SKNode!
var increaseY: SKNode!
var decreaseX: SKNode!
var decreaseY: SKNode!




var velocityX: CGFloat! = 0
var velocityY: CGFloat! = 0


var projectileOne: SKShapeNode!

var selectThree: SKNode!
var selectTwo: SKNode!
var selectOne: SKNode!

var launcher: SKSpriteNode!
var randomObject: SKSpriteNode!

////
var touchPoint: CGPoint = CGPoint()
var touching: Bool = false
////

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        launcher = childNodeWithName("launcher") as? SKSpriteNode
        selectOne = childNodeWithName("buttonOne") as? SKSpriteNode
        selectTwo = childNodeWithName("buttonTwo") as? SKSpriteNode
        selectThree = childNodeWithName("buttonThree") as? SKSpriteNode
        
        increaseX = childNodeWithName("increaseX") as? SKSpriteNode
        increaseY = childNodeWithName("increaseY") as? SKSpriteNode
        decreaseX = childNodeWithName("decreaseX") as? SKSpriteNode
        decreaseY = childNodeWithName("decreaseY") as? SKSpriteNode
        
        
        
        
        
        /////////////\/\//\/\/\/\///\/\\/
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        randomObject = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 50, height: 50))
        randomObject.physicsBody = SKPhysicsBody(rectangleOfSize: randomObject.size)
        randomObject.position = CGPoint(x: self.size.width/2.0, y: self.size.height/2.0)
        //        self.addChild(randomObject)
        /////////////\\\/\/\/\/\//\\/\/\/\/
        
        
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        //\/\/\/\/
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        if randomObject.frame.contains(location) {
            
            touchPoint = location
            touching = true
        }
        
        ///\/\//\/\/\
        
        
        //        let projectile = SKSpriteNode(imageNamed: "dolphin")
        
        let projectile = SKShapeNode(ellipseOfSize: CGSizeMake(40, 40))
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        projectile.physicsBody?.affectedByGravity = true
        projectile.fillColor = UIColor.yellowColor()
        
        
        
        //        projectile.position = CGPoint(x: 50, y: 50)
        
        projectile.position = launcher.position
        
        //        projectile.physicsBody?.mass = 1
        
        //        addChild(projectile)
        
        
        
        projectile.physicsBody?.applyImpulse(CGVectorMake(50, 50))
        
        
        
    }
    //\/\/\//\/\/
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        touchPoint = location
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        touching = false
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if selectOne .containsPoint(location) {
                
                //                println("testing")
                
                let projectile = SKShapeNode(ellipseOfSize: CGSizeMake(40, 40))
                projectile.physicsBody = SKPhysicsBody(circleOfRadius: 20)
                projectile.physicsBody?.affectedByGravity = true
                projectile.fillColor = UIColor.yellowColor()
                projectile.position = launcher.position
                addChild(projectile)
                projectile.physicsBody?.applyImpulse(CGVectorMake(velocityX, velocityY))
                
            }
            
            if selectTwo .containsPoint(location) {
                
                let projectile1 = SKShapeNode(ellipseOfSize: CGSizeMake(25, 25))
                projectile1.physicsBody = SKPhysicsBody(circleOfRadius: 12.5)
                projectile1.physicsBody?.affectedByGravity = true
                projectile1.fillColor = UIColor.redColor()
                projectile1.position = launcher.position
                addChild(projectile1)
                projectile1.physicsBody?.applyImpulse(CGVectorMake(50, 50))
            }
            
            if selectThree .containsPoint(location) {
                
                let projectile2 = SKShapeNode(ellipseOfSize: CGSizeMake(100, 100))
                projectile2.physicsBody = SKPhysicsBody(circleOfRadius: 50)
                projectile2.physicsBody?.affectedByGravity = true
                projectile2.fillColor = UIColor.cyanColor()
                projectile2.position = launcher.position
                addChild(projectile2)
                projectile2.physicsBody?.applyImpulse(CGVectorMake(50, 50))
                
                
            }
            
            if increaseX .containsPoint(location) {
                
                velocityX = velocityX + 10
                
            }
            if increaseY .containsPoint(location) {
                
                velocityY = velocityY + 10
                
            }
            if decreaseX .containsPoint(location) {
                
                velocityX = velocityX - 10
                
            }
            if decreaseY .containsPoint(location) {
                
                velocityY = velocityY - 10
                
            }
            
            
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        if touching {
            
            let dt: CGFloat = 1.0/60.0
            let distance = CGVector(dx: touchPoint.x-randomObject.position.x, dy: touchPoint.y-randomObject.position.y)
            let velocity = CGVector(dx: distance.dx/dt, dy: distance.dy/dt)
            randomObject.physicsBody!.velocity=velocity
        }
        //\/\/\/\/\/\/\
        
    }
}
