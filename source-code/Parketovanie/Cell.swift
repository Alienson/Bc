//
//  Cell.swift
//  Parketovanie
//
//  Created by Adam Turna on 12.1.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class Cell: SKSpriteNode {
    var row: Int = Int()
    var collumn: Int = Int()
    var reserved: Bool = Bool()
    
    init(row: Int, collumn: Int, isEmpty: Bool = true) {
        if isEmpty {
            super.init(texture: nil, color: UIColor.whiteColor(), size: CGSize(width: 50, height: 50))
            reserved = true
        }
        else {
            let imageNamed = "stvorec-50x50"
            let cellTexture = SKTexture(imageNamed: imageNamed)
            super.init(texture: cellTexture, color: UIColor.whiteColor(), size: cellTexture.size())
            reserved = false
        }
        self.name = "cell"
        self.row = row
        self.collumn = collumn
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
