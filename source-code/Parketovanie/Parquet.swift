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
    var arrayOfCells: [Cell] = [Cell]()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
   
    init() {
        super.init(texture: nil, color: UIColor.whiteColor(), size: CGSize(width: 50,height: 50))
    }
    init(imageNamed: String) {
        let parquetTexture = SKTexture(imageNamed: imageNamed)
        //self.arrayOfCells = arrayOfCells
        super.init(texture: parquetTexture, color: UIColor.whiteColor(), size: parquetTexture.size())
        self.name = imageNamed
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = 2
        addLastPosition(self.position)
    }
    
    init(imageNamed: String, position: CGPoint) {
        let parquetTexture = SKTexture(imageNamed: imageNamed)
        //self.arrayOfCells = arrayOfCells
        super.init(texture: parquetTexture, color: UIColor.whiteColor(), size: parquetTexture.size())
        self.name = imageNamed
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = 2
        self.barPosition = position
        self.position = position
        //addLastPosition(self.position)
    }
    
    func barPosition(point: CGPoint) {
        self.barPosition = point
        self.position = point
    }
    func changeToBarPosition() {
        self.position = self.barPosition
        
        self.zRotation = CGFloat(0.0)
        //addLastPosition(self.position)
    }
    func addLastPosition(point: CGPoint) {
        lastPosition = point
    }
    func translatePosition(point: CGPoint) {
        self.position = CGPoint(x: position.x + point.x, y: position.y + point.y)
        //for cell in arrayOfCells {
        //    cell.position = CGPoint(x: cell.position.x + point.x, y: cell.position.y + point.y)
        //}
        self.zPosition = 10
    }
    func changePosition(point: CGPoint) {
        self.position = CGPoint(x: lastPosition.x + point.x, y: lastPosition.y + point.y)
        //for cell in arrayOfCells {
        //    cell.position = CGPoint(x: cell.lastPosition.x + point.x, y: cell.lastPosition.y + point.y)
        //}
        self.zPosition = 10
        print(self)
        //addLastPosition(self.position)
    }
    
}