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
    var movable = true
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(imageNamed: String) {
        let parquetTexture = SKTexture(imageNamed: imageNamed)
        super.init(texture: parquetTexture, color: UIColor.whiteColor(), size: parquetTexture.size())
        super.name = "parquet"
    }
    
    override func isEqualToNode(node: SKNode) -> Bool {
        if node == self {
            return true
        }
        return false
    }
}