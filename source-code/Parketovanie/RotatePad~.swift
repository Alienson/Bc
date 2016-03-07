//
//  RotatePad.swift
//  Parketovanie
//
//  Created by Adam Turna on 18.2.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class RotatePad: SKSpriteNode {
    init(size: CGSize) {
        super.init(texture: nil, color: UIColor.greenColor(), size: size)
        super.name = "rotatePad"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
