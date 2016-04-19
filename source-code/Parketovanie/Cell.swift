//
//  Cell.swift
//  Parketovanie
//
//  Created by Adam Turna on 2.4.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class Cell: FrameController {
    var row: Int = Int()
    var collumn: Int = Int()
    var reserved: Bool = Bool()
    var barPosition: CGPoint?
    
    init() {
        // Testovacia Cell
        super.init(textureName: "stvorec-50x50")
    }
    
    init(position: CGPoint, parent: SKSpriteNode) {
        let texture = SKTexture(imageNamed: "stvorec-50x50")
        super.init(size: texture.size(), name: "cell", parent: parent)
        super.position = position
        addLastPosition(self.position)
    }
    
    init(row: Int, collumn: Int, isEmpty: Bool = true, parent: SKSpriteNode) {
        let imageNamed = "stvorec-50x50"
        super.init(textureName: imageNamed, name: "cell", parent: parent)
        if isEmpty {
            reserved = true
        }
        else {
            reserved = false
        }
        self.row = row
        self.collumn = collumn
        self.zPosition = CGFloat(2.0)
        addLastPosition(self.position)
    }
    
    init(row: Int, collumn: Int, parent: SKSpriteNode) {
        let texture = SKTexture(imageNamed: "stvorec-50x50")
        super.init(size: texture.size(), name: "cell", parent: parent)
        reserved = true
        self.row = row
        self.collumn = collumn
        self.zPosition = CGFloat(2.0)
        addLastPosition(self.position)
    }
    
    func reserve(reserved: Bool) {
        self.reserved = reserved
    }
    func isReserved() -> Bool {
        return reserved
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
}

