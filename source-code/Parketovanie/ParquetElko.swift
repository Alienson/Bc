//
//  ParquetElko.swift
//  Parketovanie
//
//  Created by Adam Turna on 4.4.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class ParquetElko: Parquet {
    
    init(parent: SKSpriteNode, position: CGPoint){
        super.init(imageNamed: "6-elko", position: position)
        let abstractCell = Cell()
        let height = abstractCell.frame.height
        self.arrayOfCells.append(Cell(position: CGPoint(x: self.frame.minX, y: self.frame.maxY-height), parent: parent))
        self.arrayOfCells.append(Cell(position: CGPoint(x: self.frame.minX, y: self.frame.maxY-height*2), parent: parent))
        self.arrayOfCells.append(Cell(position: CGPoint(x: self.frame.minX, y: self.frame.maxY-height*3), parent: parent))
        self.arrayOfCells.append(Cell(position: CGPoint(x: self.frame.minX+height, y: self.frame.maxY-height*3), parent: parent))
        
        
        //let cell1 = Cell(row: 1, collumn: 1, isEmpty: true, parent: parent)
        for cell in self.arrayOfCells {
            parent.addChild(cell)
            cell.alpha = CGFloat(1)
        }
        super.alpha = CGFloat(0.5)
        //self.arrayOfCells = [[Cell(position: CGPoint(self.frame.),parent: parent), nil],[Cell(parent: parent), nil],[Cell(parent: parent), Cell(parent: parent)]]
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}