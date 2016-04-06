//
//  Level.swift
//  Parketovanie
//
//  Created by Adam Turna on 14.3.2016.
//  Copyright © 2016 Adam Turna. All rights reserved.
//

import Foundation
import SpriteKit

class Level {
    var values = [
        //1: (color: UIColor(red: 97, green: 201, blue: 155, alpha: 1), string: "prvý"),
        1: (color: UIColor(hexString: "#ffe700ff")!, string: "prvý"),
        2: (color: UIColor.redColor(), string: "druhý"),
        3: (color: UIColor.blackColor(), string: "tretí")
    ]
    func value(key: Int) -> (color: UIColor, string: String) {
        return self.values[key]!
    }
}



// let gold = UIColor(hexString: "#ffe700ff")
extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.startIndex.advancedBy(1)
            let hexColor = hexString.substringFromIndex(start)
            
            if hexColor.characters.count == 8 {
                let scanner = NSScanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexLongLong(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}