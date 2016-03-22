//
//  Parquet.swift
//  Parketovanie
//
//  Created by Adam Turna on 11.1.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit


class Parquet: SKSpriteNode {
    var rotatable = false
    var barPosition = CGPoint()
    var lastPosition = CGPoint()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init() {
        super.init(texture: nil, color: UIColor.whiteColor(), size: CGSize(width: 50,height: 50))
    }
    
    init(imageNamed: String) {
        let parquetTexture = SKTexture(imageNamed: imageNamed)
        super.init(texture: parquetTexture, color: UIColor.whiteColor(), size: parquetTexture.size())
        self.name = imageNamed
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = 1
    }
    
    func barPosition(point: CGPoint) {
        self.barPosition = point
        self.position = point
    }
    func changeToBarPosition() {
        self.position = self.barPosition
        self.zRotation = CGFloat(0.0)
    }
    func addLastPosition(point: CGPoint) {
        lastPosition = point
    }
    
}