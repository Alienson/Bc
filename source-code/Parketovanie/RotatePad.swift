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
    var catchedParquet = Parquet()
    var isPadEmpty = true
    
    init(size: CGSize) {
        super.init(texture: nil, color: UIColor.greenColor(), size: size)
        super.name = "rotatePad"
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.inputAccessoryViewController
        self.isPadEmpty = true
        
        super.position = CGPoint(x: 40, y: 500)
        //super.alpha = CGFloat(0.5)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isOnPadPosition(nodePosition: CGPoint) -> Bool {
        print(nodePosition)
        // zistit ci sa parketa nachadza na pozicii rotatePad
        return true
    }
    
    func midOfPad() -> CGPoint {
        let centerPoint: CGPoint = CGPoint(x: self.frame.midX, y: self.frame.midY)
        return centerPoint
    }
    
    func setParquetToPad(parquet: Parquet) {
        self.catchedParquet = parquet
        self.isPadEmpty = false
    }
    
}
