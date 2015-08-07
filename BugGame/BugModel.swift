//
//  BugModel.swift
//  BugGame
//
//  Created by Chi Zhang on 7/28/15.
//  Copyright (c) 2015 Chi Zhang. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class BugModel {
    
    var initPosition: CGPoint? {
        didSet {
            self.spriteNode.position = self.initPosition!
        }
    }
    
    var velocity: CGPoint?
    
    var spriteNode: SKSpriteNode = SKSpriteNode(imageNamed: "SmallBug")
    
    var spriteSize: CGSize {
        return self.spriteNode.size
    }
    
    
    func setRandomPosition(x: Double, y: Double) {
        self.initPosition = CGPoint(x:x, y:y)
    }
    
    func setRandomVelocity() {
        let randomSpeed: Double = Double(arc4random_uniform(100)) / 20.0
        let directionMax = UInt32(2 * M_PI * 100)
        let randomDirection: Double = Double(arc4random_uniform(directionMax)) / 100.0
        let velocityX = randomSpeed * cos(randomDirection)
        let velocityY = randomSpeed * sin(randomDirection)
        self.velocity = CGPoint(x:velocityX, y:velocityY)
    }
    
    func bounce(maxX: CGFloat, maxY:CGFloat) {
        let currentPosition = self.spriteNode.position
        if currentPosition.x < 0.0 || (currentPosition.x + self.spriteSize.width) > maxX {
            self.velocity!.x = -self.velocity!.x
        }
        else if currentPosition.y < 0.0 || (currentPosition.y + self.spriteSize.height) > maxY {
            self.velocity!.y = -self.velocity!.y
        }
    }
    
    

}