//
//  Surface.swift
//  Parketovanie
//
//  Created by Adam Turna on 14.2.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class Surface {
    var arrayOfCells: [[Cell]] = [[Cell]]()
    
    init(rows: Int, collumns: Int, parent: SKSpriteNode) {
        for row in 0...rows-1 {
            var cellsForRow = [Cell]()
            for collumn in 0...collumns-1 {
                let cell = Cell(row: row, collumn: collumn, isEmpty: false)
                cellsForRow.append(cell)
                let x = CGRectGetMidX(parent.frame) - CGFloat(50 * row)
                let y = CGRectGetMidY(parent.frame) - CGFloat(50 * collumn)
                cell.position = CGPoint(x: x-250, y: y-200)
                parent.addChild(cell)
                print(row, collumn)
            }
            arrayOfCells.append(cellsForRow)
        }
    }
    
    init(rows: Int, collumns: Int, parent: SKSpriteNode, listOfEmptys: [Int:[Int]]) {
        for row in 0...rows {
            var cellsForRow = [Cell]()
            for collumn in 0...collumns {
                let cell = Cell(row: row, collumn: collumn)
                cellsForRow.append(cell)
                parent.addChild(cell)
            }
            arrayOfCells.append(cellsForRow)
        }
    }
    
}