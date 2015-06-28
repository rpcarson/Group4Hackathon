//
//  GameScene.swift
//  Group4Hackathon
//
//  Created by Reed Carson on 6/26/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import SpriteKit
import AVFoundation

var server1: SKSpriteNode!
var server2: SKSpriteNode!

var server: SKSpriteNode!

var projectile1: SKSpriteNode!

var juniorTex: SKTexture!
var resetGame: SKSpriteNode!

var score: Int!
var label2: SKLabelNode!
var computer: SKSpriteNode!
var contactMask: UInt32 = 1
var contactMaskComputer: UInt32 = 2
var destroyableMask: UInt32 = 3

var floor: SKSpriteNode!

//var fireEffect = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cannon", ofType: "wav")!)

//var audioPlayer = AVAudioPlayer()


var Xlabel: SKLabelNode!
var Ylabel: SKLabelNode!

var budget: SKLabelNode!

var budgetNumber: Int = 50000

var reset: SKSpriteNode!

class GameScene: SKScene, SKPhysicsContactDelegate {

    
    
    override func didMoveToView(view: SKView) {
        
//        var bg = SKSpriteNode(imageNamed: "background")
//        bg.size = self.frame.size
//        bg.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
//        addChild(bg)
       
        
        server2 = childNodeWithName("server") as? SKSpriteNode
        server1 = childNodeWithName("server") as? SKSpriteNode

        server = childNodeWithName("server") as? SKSpriteNode
        
        juniorTex = SKTexture(imageNamed: "fullstacker")
        
        resetGame = childNodeWithName("resetGame") as? SKSpriteNode
        resetGame.hidden = true
        
        label2 = childNodeWithName("label2") as? SKLabelNode
        label2.hidden = true
        
        floor = childNodeWithName("floor") as? SKSpriteNode
        computer = childNodeWithName("computer") as? SKSpriteNode
        
        budget = childNodeWithName("budget") as? SKLabelNode
        reset = childNodeWithName("reset") as? SKSpriteNode
        
        Xlabel = childNodeWithName("axisXLabel") as? SKLabelNode
        Ylabel = childNodeWithName("axisYLabel") as? SKLabelNode
        
        launcher = childNodeWithName("launcher") as? SKSpriteNode
        selectOne = childNodeWithName("buttonOne") as? SKSpriteNode
        selectTwo = childNodeWithName("buttonTwo") as? SKSpriteNode
        selectThree = childNodeWithName("buttonThree") as? SKSpriteNode
        
        increaseX = childNodeWithName("increaseX") as? SKSpriteNode
        increaseY = childNodeWithName("increaseY") as? SKSpriteNode
        decreaseX = childNodeWithName("decreaseX") as? SKSpriteNode
        decreaseY = childNodeWithName("decreaseY") as? SKSpriteNode
        
  
        server.physicsBody?.categoryBitMask = destroyableMask
        server1.physicsBody?.categoryBitMask = destroyableMask
        server2.physicsBody?.categoryBitMask = destroyableMask

        
//        println(server.physicsBody?.categoryBitMask)
        
        computer.physicsBody = SKPhysicsBody(rectangleOfSize: computer.size)
        computer.physicsBody?.usesPreciseCollisionDetection = true
        computer.physicsBody?.categoryBitMask = contactMaskComputer
 
        
        floor.physicsBody = SKPhysicsBody(rectangleOfSize: floor.size)
        floor.physicsBody?.affectedByGravity = false
//        floor.physicsBody?.categoryBitMask = contactMask
        floor.physicsBody?.pinned = true
        floor.physicsBody?.allowsRotation = false
        floor.physicsBody?.dynamic = false
        
        //        floor.physicsBody?.mass = 10
        
        
        physicsWorld.contactDelegate = self
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    //\/\/\//\/\/
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        touchPoint = location
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            
            if selectOne .containsPoint(location) {
                
                let projectile = SKShapeNode(ellipseOfSize: CGSizeMake(40, 40))
                projectile.physicsBody = SKPhysicsBody(circleOfRadius: 20)
                projectile.physicsBody?.affectedByGravity = true
                projectile.physicsBody?.usesPreciseCollisionDetection = true
                projectile.fillColor = UIColor.yellowColor()
                projectile.position = launcher.position
                projectile.physicsBody?.categoryBitMask = contactMask
                projectile.physicsBody?.contactTestBitMask = contactMaskComputer
                
                addChild(projectile)
                
                projectile.physicsBody?.applyImpulse(CGVectorMake(velocityX, velocityY))
                budgetNumber = budgetNumber - 2500
                
                
            }
            
            if selectTwo .containsPoint(location) {
                
                let projectile1 = SKSpriteNode(imageNamed: "fullstacker")
                projectile1.physicsBody = SKPhysicsBody(texture: juniorTex, size: CGSize(width: 100, height: 100))
                projectile1.physicsBody?.affectedByGravity = false
                projectile1.physicsBody?.usesPreciseCollisionDetection = false
//                projectile1.fillColor = UIColor.redColor()
                projectile1.position = CGPoint(x: 50, y: velocityY * 5)
                projectile1.physicsBody?.categoryBitMask = 6
                projectile1.physicsBody?.contactTestBitMask = destroyableMask
                
             
                
                addChild(projectile1)
                
                projectile1.physicsBody?.applyImpulse(CGVectorMake(15, 0))
                
                
                budgetNumber = budgetNumber - 20000
                
            }
            
            if selectThree .containsPoint(location) {
                
                let projectile2 = SKShapeNode(ellipseOfSize: CGSizeMake(100, 100))
                projectile2.physicsBody = SKPhysicsBody(circleOfRadius: 50)
                projectile2.physicsBody?.affectedByGravity = true
                projectile2.physicsBody?.usesPreciseCollisionDetection = true
                projectile2.fillColor = UIColor.cyanColor()
                projectile2.position = launcher.position
                projectile2.physicsBody?.categoryBitMask = contactMask
                projectile2.physicsBody?.contactTestBitMask = contactMaskComputer
                addChild(projectile2)
                projectile2.physicsBody?.applyImpulse(CGVectorMake(velocityX * 6, velocityY * 6))
                budgetNumber = budgetNumber - 5000
                
                
            }
            
            if reset .containsPoint(location) {
                
                velocityX = 0
                velocityY = 0
                
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
            if resetGame .containsPoint(location) {
                
                println("end game and reset")
            
            }
            
            
        }
    }
    
    func restartGame() {
//        self.removeAllActions()
//        self.removeChildrenInArray(nodes: [projectile]!)
//        createGame()
    }
    
    func createGame() {
      
//        let scoreScreen = self.storyboard?.instantiateViewControllerWithIdentifier("scoreScreen") as! UIViewController
//        self.presentViewController(scoreScreen, animated: true, completion: nil)
    }
    
   
    func removeMissile() {
        
        println("missile")
        server.removeFromParent()
//        projectile1?.removeFromParent()
//        reloadInputViews()
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        //        println("test")
        
                let firstNode = contact.bodyA.node as? SKSpriteNode
                let secondNode = contact.bodyB.node as? SKSpriteNode
        
        let firstMask = contact.bodyA.categoryBitMask
        let secMask = contact.bodyB.categoryBitMask
        
        if (firstMask == 6) && (secMask == destroyableMask) || (firstMask == destroyableMask) && (secMask == 6){

           
           
            
            
            firstNode?.removeFromParent()
            secondNode?.removeFromParent()
            
//            println("missile")
            
            
//            projectile1.removeFromParent()
//            server.removeFromParent()
            
            
        }
        
         if (firstMask == contactMaskComputer) && (secMask == contactMask) {
//            println("yay")
            
            
            computer.removeFromParent()
            
//            resetGame.hidden = false
            
            label2.hidden = false
            
            if budgetNumber <= 0 {
                
                label2.text = "You Are $\(abs(budgetNumber)) Over Budget"
                
            } else {
                
                label2.text = "You Have $\(abs(budgetNumber)) Leftover!"
            }
        }
            
        
        
      
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        Xlabel.text = "\(velocityX)"
        Ylabel.text = "\(velocityY)"
        
        budget.text = "\(budgetNumber)"
        
    }
}
