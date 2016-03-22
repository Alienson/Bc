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
    var surfaceBackground = SKSpriteNode()
    var surface = SKSpriteNode()
    var level = Level()
    var parent = SKSpriteNode()
    
    init() {
        
    }
    
    init(rows: Int, collumns: Int, parent: SKSpriteNode, levelNumber: Int) {
        self.parent = parent
        
        surfaceBackground = SKSpriteNode(texture: nil, color: level.value(levelNumber).color, size: CGSize(width: 743, height: 550))
        surfaceBackground.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        surfaceBackground.name = "surfaceBackground"
        surfaceBackground.position = CGPoint(x: 280, y: 176)
        surfaceBackground.alpha = CGFloat(1.0)
        
        surface = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: CGSize(width: collumns*50, height: rows*50))
        surface.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        surface.name = "surface"
        surface.position = CGPoint(x: surfaceBackground.frame.width/2, y: surfaceBackground.frame.height/2)
        surface.alpha = CGFloat(1.0)
        surface.zPosition = CGFloat(1.0)
        
        for row in 0...rows-1 {
            var cellsForRow = [Cell]()
            for collumn in 0...collumns-1 {
                let cell = Cell(row: row, collumn: collumn, isEmpty: false)
                cellsForRow.append(cell)
                let x = surface.frame.width/2 - CGFloat(50 * collumn) - 25
                let y = surface.frame.height/2 - CGFloat(50 * row) - 25
                cell.position = CGPoint(x: x, y: y)
                cell.alpha = CGFloat(2.0)
                surface.addChild(cell)
            }
            arrayOfCells.append(cellsForRow)
        }
        
        self.parent.addChild(surfaceBackground)
        surfaceBackground.addChild(surface)
        
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
    
    func isOnSurfacePosition(node: SKNode) -> Bool {
        
        let x = surface.position.x + surface.frame.height
        let y = surface.position.y + surface.frame.width
        //print(surface.position.x,surface.position.y)
        //print(x, y)
        //let nodeConvertedPosition = surface.convertPoint(node.position, toNode: surfaceBackground)
        let nodeConvertedPosition = surface.convertPoint(surface.position, toNode: self.parent)
        print("node Position:")
        print(node.position.x, node.position.y)
        print(nodeConvertedPosition.x, nodeConvertedPosition.y)
        
        // zistit ci sa parketa nachadza na pozicii surface
        if (
            node.position.x >= (nodeConvertedPosition.x - surface.frame.height/2) &&
            node.position.y >= (nodeConvertedPosition.y - surface.frame.width/2) &&
            node.position.x <= (nodeConvertedPosition.x + surface.frame.height/2) &&
            node.position.y <= (nodeConvertedPosition.y + surface.frame.width/2)) {
                return true
        }
        return false
    }
    
    func midOfSurface() -> CGPoint {
        let centerPoint: CGPoint = CGPoint(x: self.surface.frame.midX, y: self.surface.frame.midY)
        return centerPoint
    }
    
}