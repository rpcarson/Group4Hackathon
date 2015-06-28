
//  NewGameScreen.swift
//  Group4Hackathon
//
//  Created by Reed Carson on 6/27/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import SpriteKit


var bigTitle: SKLabelNode!
var startButton: SKSpriteNode!

class NewGameScreen: SKScene {
    
    
    
    override func didMoveToView(view: SKView) {
        
        
        
        
        
        
        backgroundColor = UIColor.blackColor()
        
        startButton = childNodeWithName("startButton") as? SKSpriteNode
        bigTitle = childNodeWithName("bigTitle") as? SKLabelNode
        
//        bigTitle = SKLabelNode(fontNamed: "Georgia")
    }
    
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            
            
            var transition = SKTransition.flipVerticalWithDuration(1.0)
            self.scene!.view!.presentScene(scene, transition: transition)
        }
    }
            

    
}
