//
//  RotatePad.swift
//  Parketovanie
//
//  Created by Adam Turna on 18.2.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class RotatePad: FrameController {
    var catchedParquet = Parquet()
    var isPadEmpty = true
    
    init(size: CGSize) {
        super.init(size: size, position: CGPoint(x: 40, y: 500), name: "rotatePad", color: UIColor.greenColor())
        //self.inputAccessoryViewController
        self.isPadEmpty = true
        
        super.position = CGPoint(x: 40, y: 500)
        //super.alpha = CGFloat(0.5)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pinParquetToPad(parquet: Parquet) {
        self.catchedParquet = parquet
        self.catchedParquet.rotatable = true
        self.isPadEmpty = false
    }
    func unpinParquetFromPad() {
        self.catchedParquet.rotatable = false
        self.catchedParquet = Parquet()
        self.isPadEmpty = true
    }
    
}
