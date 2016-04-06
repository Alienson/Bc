//
//  SurfaceBackground.swift
//  Parketovanie
//
//  Created by Adam Turna on 14.2.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class SurfaceBackground: FrameController {
    var arrayOfCells: [[Cell]] = [[Cell]]()
    var level = Level()
    
    init(parent: SKSpriteNode, levelNumber: Int) {
        let size = CGSize(width: 743, height: 550)
        let position = CGPoint(x: 280, y: 176)
        let color = level.value(levelNumber).color
        
        super.init(size: size, name: "surfaceBackground", position: position, parent: parent, color: color)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}