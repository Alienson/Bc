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
    init(size: CGSize, position: CGPoint, name: String) {
        super.init(texture: nil, color: UIColor.whiteColor(), size: size)
        super.name = name
        self.anchorPoint = CGPoint(x: 0, y: 0)
        super.alpha = CGFloat(0.0)
    }
    
    init(size: CGSize, position: CGPoint, name: String, color: UIColor) {
        super.init(texture: nil, color: color, size: size)
        super.name = name
        self.anchorPoint = CGPoint(x: 0, y: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func midOfFrame() -> CGPoint {
        let centerPoint: CGPoint = CGPoint(x: self.frame.midX, y: self.frame.midY)
        return centerPoint
    }
    
    func isOnFramePosition(nodePosition: CGPoint) -> Bool {
        print(nodePosition)
        // zistit ci sa parketa nachadza na pozicii frame
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
