//
//  Surface.swift
//  Parketovanie
//
//  Created by Adam Turna on 25.3.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class Surface: FrameController {
    var arrayOfCells: [[Cell]] = [[Cell]]()
    var level = Level()
    
    init(rows: Int, collumns: Int, parent: SKSpriteNode, background: SurfaceBackground) {
        let size = CGSize(width: collumns*50, height: rows*50)
        super.init(size: size, name: "surface", parent: parent)
        self.position = CGPoint(x: background.midOfFrame().x - self.frame.width/2, y: background.midOfFrame().y - self.frame.height/2)        
        
        for row in 0...rows-1 {
            var cellsForRow = [Cell]()
            for collumn in 0...collumns-1 {
                let cell = Cell(row: row, collumn: collumn, isEmpty: false, parent: parent)
                cellsForRow.append(cell)
                let x = self.position.x + CGFloat(Int(cell.frame.width) * collumn)
                let y = self.position.y + CGFloat(Int(cell.frame.height) * row)
                cell.position = CGPoint(x: x, y: y)
                //print(x,y)
                cell.alpha = CGFloat(1.0)
                parent.addChild(cell)
            }
            arrayOfCells.append(cellsForRow)
        }
    }
    
    init(rows: Int, collumns: Int, parent: SKSpriteNode, background: SKSpriteNode, listOfEmptys: [Int:[Int]]) {
        let size = CGSize(width: collumns*50, height: rows*50)
        //let position = CGPoint(x: (background.frame.width-size.width)/2, y: (background.frame.height-size.height)/2)
        super.init(size: size, name: "surface", parent: parent)
        
        for row in 0...rows-1 {
            var cellsForRow = [Cell]()
            for collumn in 0...collumns-1 {
                let cell = Cell(row: row, collumn: collumn, isEmpty: false, parent: parent)
                cellsForRow.append(cell)
                let x = self.frame.width/2 - CGFloat(50 * collumn) - 25
                let y = self.frame.height/2 - CGFloat(50 * row) - 25
                cell.position = CGPoint(x: x, y: y)
                cell.alpha = CGFloat(0.0)
                self.addChild(cell)
            }
            arrayOfCells.append(cellsForRow)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}