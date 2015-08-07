//
//  PlayScene.swift
//  BugGame
//
//  Created by Chi Zhang on 7/28/15.
//  Copyright (c) 2015 Chi Zhang. All rights reserved.
//

// Citation: http://stackoverflow.com/questions/25823116/how-can-i-pausing-a-game-in-spritekit-and-scenekit-swift

import Foundation
import SpriteKit
import AVFoundation

class PlayScene: SKScene {
    
    var tenBugs: [BugModel] = []
    
    var counter: Int = 0
    let scoreText = SKLabelNode(fontNamed: "ArialMT")

    let pauseButton = SKSpriteNode(imageNamed: "pause")
    let pauseText = SKLabelNode(fontNamed: "ArialMT")
    var playing: Bool = true
    
    var timer = NSTimer()
    var time: Int = 60
    var timerText = SKLabelNode(fontNamed: "ArialMT")
    
    var audioPlayer = AVAudioPlayer()
    var sound = SKAction.playSoundFileNamed("DeadBugSound.mp3", waitForCompletion: false)
    

    override func didMoveToView(view: SKView) {
        
        Score.value = 0
        
        
        println("new scene")
        self.backgroundColor = UIColor.whiteColor()
        
        self.scoreText.text = "\(Score.value)"
        self.scoreText.fontSize = 100
        self.scoreText.position = CGPoint(x: CGRectGetMaxX(self.frame)/2, y: 40.0)
        self.scoreText.fontColor = SKColor.greenColor()
        self.addChild(scoreText)
        
        self.pauseButton.position = CGPoint(x: 60.0, y: 60.0)
        self.addChild(self.pauseButton)
        
        self.timerText.text = "\(time)"
        self.timerText.fontSize = 80
        self.timerText.position = CGPoint(x: CGRectGetMaxX(self.frame)/2, y: 500)
        self.timerText.fontColor = SKColor.purpleColor()
        self.addChild(timerText)
        
        
        for i in 0..<10 {
            var newBug = BugModel()
            startBug(newBug)
            tenBugs.append(newBug)
            self.addChild(tenBugs[i].spriteNode)
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
            
        println("\(tenBugs.count)")
        
    }
    
    func updateTimer() {
        if time > 0 {
            time--
            timerText.text = "\(time)"
        }
    }
    
    // func reload game
    
    override func update(currentTime: NSTimeInterval) {
        if (playing) {
            for i in 0..<10 {
                let v = tenBugs[i].velocity!
                tenBugs[i].spriteNode.position.x += v.x
                tenBugs[i].spriteNode.position.y += v.y
                tenBugs[i].spriteNode.zRotation = atan(v.y / -v.x)
                tenBugs[i].bounce(self.scene!.size.width, maxY: self.scene!.size.height)
            }
        }
        
        
        if time == 0 {
            var scene = EndScene(size: self.size)
            let skView = self.view as SKView!
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            scene.size = skView.bounds.size
            skView.presentScene(scene)
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let what = self.nodeAtPoint(location)
        
        self.pauseText.text = "Click Here to Restart"
        self.pauseText.fontSize = 20
        self.pauseText.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        self.pauseText.fontColor = SKColor.blackColor()
        
        for i in 0..<10 {
            if what == tenBugs[i].spriteNode {
                tenBugs[i].velocity = CGPoint(x: 0.0, y: 0.0)
                playSound(sound)
                Score.value++
                self.scoreText.text = "\(Score.value)"
                startBug(tenBugs[i])
            }
        }
        
        if what == pauseButton {
            addChild(pauseText) // add the text
            pauseButton.removeFromParent()
            self.runAction (SKAction.runBlock(self.pauseGame))
        }
        
        if what == self.pauseText {
            pauseText.removeFromParent() // remove the pause text
            self.view!.paused = false // resume the game
            addChild(pauseButton) // add the pause button
        }
        
    }
    
    func playSound(sound: SKAction) {
        runAction(sound)
    }
    
    
    func pauseGame() {
        self.scene!.view?.paused = true
    }
    

    func startBug(bug: BugModel) {
        let x = arc4random_uniform(UInt32(self.scene!.size.width - bug.spriteSize.width))
        let y = arc4random_uniform(UInt32(self.scene!.size.height - bug.spriteSize.height))
        bug.setRandomPosition(Double(x), y: Double(y))
        bug.setRandomVelocity()
    }
    
}
