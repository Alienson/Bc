//
//  LeftBar.swift
//  Parketovanie
//
//  Created by Adam Turna on 20.3.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class LeftBar: FrameController {
    var listOfParquets: [Parquet] = []
    var level = Level()
    
    init(size: CGSize, level: Int, parent: SKSpriteNode) {
        //size: CGSize(width: 200, height: 200), level: levelNumber, parent: background
        //super.init(size: size, name: "leftBar", parent: parent)
        super.init(size: size, name: "leftBar", parent: parent, color: UIColor.redColor())
        //let test = SKSpriteNode(texture: nil, color: UIColor.blackColor(), size: size)
        //test.anchorPoint = CGPoint(x: 0,y: 0)
        //parent.addChild(test)
        self.position = CGPoint(x: 0,y: 0)
        leftBarlvl1()
    }
    
    func leftBarlvl1() {
        
        //        let leftBar = SKSpriteNode(imageNamed: "lava_lista")
        //        leftBar.position    = CGPoint(x:0, y: 0)
        //        leftBar.anchorPoint = CGPoint(x: 0, y: 0)
        //        leftBar.name = "lava_lista"
        //        background.addChild(leftBar)
        //
        let offset = CGFloat(12.5)
        let offsetY = CGFloat(100)
        let width = self.frame.width
        let firstLineParquets = CGFloat(250)
        let secondLineParquets = CGFloat(150)
        
        //        _ = leftBar.size.height
        //        let width = leftBar.size.width
        
        
        
        let mono            = Parquet(imageNamed: "1-mono")
        let duo             = Parquet(imageNamed: "2-duo")
        let trio            = Parquet(imageNamed: "3-3I")
        let roztek          = Parquet(imageNamed: "4-roztek")
        let stvorka         = Parquet(imageNamed: "5-stvorka")
        //let elko            = Parquet(imageNamed: "6-elko")
        let elko_obratene   = Parquet(imageNamed: "7-elko-obratene")
        
        let newElko         = ParquetElko(parent: superParent, position: CGPointMake(width / 3 - offset, offsetY))
        
        mono.barPosition(CGPointMake(width / 4 - offset, offsetY+firstLineParquets))
        duo.barPosition(CGPointMake(width / 2, offsetY+firstLineParquets+25))
        trio.barPosition(CGPointMake(3 * width / 4 + offset, offsetY+firstLineParquets+50))
        roztek.barPosition(CGPointMake(width / 3 - offset, offsetY+secondLineParquets))
        stvorka.barPosition(CGPointMake(2 * width / 3 + offset, offsetY+secondLineParquets))
        //elko.barPosition(CGPointMake(width / 3 - offset, offsetY))
        newElko.barPosition(CGPointMake(width / 3 - offset, offsetY))
        superParent.addChild(newElko)
        elko_obratene.barPosition(CGPointMake(2 * width / 3 + offset, offsetY))
        
        listOfParquets.append(mono)
        listOfParquets.append(duo)
        listOfParquets.append(trio)
        listOfParquets.append(roztek)
        listOfParquets.append(stvorka)
        //listOfParquets.append(elko)
        listOfParquets.append(elko_obratene)
        
        for par in listOfParquets {
            superParent.addChild(par)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
