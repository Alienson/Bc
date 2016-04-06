//
//  FrameController.swift
//  Parketovanie
//
//  Created by Adam Turna on 20.3.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class FrameController: SKSpriteNode {
    var superParent: SKSpriteNode
    
    init(textureName: String) {
        superParent = SKSpriteNode()
        let texture = SKTexture(imageNamed: textureName)
        super.init(texture: nil, color: UIColor.whiteColor(), size: texture.size())
    }
    
    init(size: CGSize, name: String, parent: SKSpriteNode) {
        self.superParent = parent
        super.init(texture: nil, color: UIColor.whiteColor(), size: size)
        self.name = name
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.alpha = CGFloat(0.0)
    }
    
    init(size: CGSize, name: String, parent: SKSpriteNode, color: UIColor) {
        self.superParent = parent
        super.init(texture: nil, color: color, size: size)
        self.name = name
        self.anchorPoint = CGPoint(x: 0, y: 0)
    }
    init(size: CGSize, name: String, position: CGPoint, parent: SKSpriteNode, color: UIColor) {
        self.superParent = parent
        super.init(texture: nil, color: color, size: size)
        self.name = name
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.position = position
    }
    init(textureName: String, name: String, parent: SKSpriteNode) {
        let texture = SKTexture(imageNamed: textureName)
        self.superParent = parent
        super.init(texture: texture, color: UIColor.whiteColor(), size: texture.size())
        self.name = name
        self.anchorPoint = CGPoint(x: 0, y: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func midOfFrame() -> CGPoint {
        //let centerPoint = self.convertPoint(CGPoint(x: self.frame.midX, y: self.frame.midY), toNode: self.superParent)
        let centerPoint = CGPoint(x: self.frame.midX, y: self.frame.midY)
        return centerPoint
        
        //let centerPoint: CGPoint = CGPoint(x: self.frame.midX, y: self.frame.midY)
        //return centerPoint
    }
    
    func isOnFramePosition(nodePosition: CGPoint) -> Bool {
        // zistit ci sa parketa nachadza na pozicii frame
        //let nodeConvertedPosition = self.convertPoint(CGPointZero, toNode: self.superParent)
        //print(testPoint, testPoint.x - nodeConvertedPosition.x, testPoint.y - nodeConvertedPosition.y)
        
        // zistit ci sa parketa nachadza na pozicii surface
//        if (
//            nodePosition.x >= (nodeConvertedPosition.x) &&
//            nodePosition.y >= (nodeConvertedPosition.y) &&
//            nodePosition.x <= (nodeConvertedPosition.x + self.frame.height) &&
//            nodePosition.y <= (nodeConvertedPosition.y + self.frame.width)) {
//                return true
//        }
//        return false
        if (
            nodePosition.x >= self.position.x &&
            nodePosition.y >= self.position.y &&
            nodePosition.x <= (self.position.x + self.frame.height) &&
            nodePosition.y <= (self.position.y + self.frame.width)) {
            return true
        }
        return false
    }
}
