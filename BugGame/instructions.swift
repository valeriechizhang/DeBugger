//
//  instructions.swift
//  BugGame
//
//  Created by Chi Zhang on 7/30/15.
//  Copyright (c) 2015 Chi Zhang. All rights reserved.
//

import Foundation
import SpriteKit

class instructions: SKScene {
    
    let backButton = SKLabelNode(fontNamed: "Arial")
    var directions1 = SKLabelNode(fontNamed: "Arial")
    var directions2 = SKLabelNode(fontNamed: "Arial")
    var directions3 = SKLabelNode(fontNamed: "Arial")
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.whiteColor()
        
        self.backButton.text = "Back"
        self.backButton.fontSize = 20
        self.backButton.position = CGPointMake(self.frame.size.width/2, 200)
        self.backButton.fontColor = SKColor.blackColor()
        self.addChild(self.backButton)
        
        self.directions1.text = "Goal: Debug as may bugs as you can in 60 seconds"
        self.directions1.fontSize = 15
        self.directions1.position = CGPointMake(self.frame.size.width/2, 400)
        self.directions1.fontColor = SKColor.blackColor()
        self.addChild(self.directions1)
        
        self.directions2.text = "How: Tap the bugs with your finger to debug them"
        self.directions2.fontSize = 15
        self.directions2.position = CGPointMake(self.frame.size.width/2, 370)
        self.directions2.fontColor = SKColor.blackColor()
        self.addChild(self.directions2)
        
        self.directions3.text = "Have fun debugging!"
        self.directions3.fontSize = 15
        self.directions3.position = CGPointMake(self.frame.size.width/2, 340)
        self.directions3.fontColor = SKColor.blackColor()
        self.addChild(self.directions3)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if self.nodeAtPoint(location) == self.backButton {
                var scene = GameScene(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
