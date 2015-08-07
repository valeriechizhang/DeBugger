//
//  EndScene.swift
//  BugGame
//
//  Created by Chi Zhang on 7/30/15.
//  Copyright (c) 2015 Chi Zhang. All rights reserved.
//

import Foundation
import SpriteKit


class EndScene: SKScene {
    
    //var score: Int = 0
    
    let restartButton = SKSpriteNode(imageNamed: "restart")
    var finalScore = SKLabelNode(fontNamed: "ArialMT")
    let scoreLabel = SKLabelNode(fontNamed: "ArialMT")
    
    
    
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = UIColor.whiteColor()
        
        self.restartButton.position = CGPoint(x: CGRectGetMaxX(self.frame)/2, y: 200)
        self.addChild(self.restartButton)
        
        
        self.finalScore.position = CGPoint(x: CGRectGetMaxX(self.frame)/2, y: 500)
        self.finalScore.fontColor = SKColor.blueColor()
        self.finalScore.text = "\(Score.value)"
        self.finalScore.fontSize = 50
        self.addChild(self.finalScore)
        
    
        self.scoreLabel.text = "Score"
        self.scoreLabel.fontSize = 50
        self.scoreLabel.fontColor = SKColor.lightGrayColor()
        self.scoreLabel.position = CGPoint(x: CGRectGetMaxX(self.frame)/2, y: 550)
        self.addChild(self.scoreLabel)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if self.nodeAtPoint(location) == self.restartButton {
                var scene = PlayScene(size: self.size)
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
