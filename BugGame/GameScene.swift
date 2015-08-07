//
//  GameScene.swift
//  BugGame
//
//  Created by Chi Zhang on 7/28/15.
//  Copyright (c) 2015 Chi Zhang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "play")
    let gameName = SKLabelNode(fontNamed: "Arial")
    let directionButton = SKLabelNode(fontNamed: "Arial")
    
    override func didMoveToView(view: SKView) {
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(self.playButton)
        self.backgroundColor = UIColor.whiteColor()
        
        self.gameName.text = "DeBugger"
        self.gameName.fontSize = 70
        self.gameName.position = CGPoint(x: CGRectGetMaxX(self.frame)/2, y: 500)
        self.gameName.fontColor = SKColor.darkGrayColor()
        self.addChild(self.gameName)
        
        self.directionButton.text = "Instructions"
        self.directionButton.fontSize = 40
        self.directionButton.position = CGPoint(x: CGRectGetMaxX(self.frame)/2, y: 50)
        self.directionButton.fontColor = SKColor.grayColor()
        self.addChild(self.directionButton)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if self.nodeAtPoint(location) == self.playButton {
                var scene = PlayScene(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            if self.nodeAtPoint(location) == self.directionButton {
                var scene = instructions(size: self.size)
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
