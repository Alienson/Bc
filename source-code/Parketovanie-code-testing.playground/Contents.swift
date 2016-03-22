//: Playground - noun: a place where people can play

import Foundation
import SpriteKit

// Level.First.int      // 1
// Level.First.color    //
// Level.First.string   // prvý
class Level {
    var values = [
        1: (color: "cerveny", string: "prvý"),
        2: (color: "modry", string: "druhý"),
        3: (color: "ruzovy", string: "tretí")
    ]
    func valuesForKey(key: Int) {
        values[key]
    }
}
let lvl = Level()
lvl.valuesForKey(3)

//enum Level {
//    case First
//    case Second
//    case Third
//    
//    private static let values = [
//        First:  (int: 1,  string: "prvý"),
//        Second: (int: 2,  string: "druhý"),
//        Third:  (int: 3,  string: "tretí")
//    ]
//    
//    var int: Int {
//        return Level.values[self]!.int;
//    }
//    var string: String {
//        return Level.values[self]!.string;
//    }
//}
//
//let lvl = Level.First
//lvl.int
//lvl.string
//lvl.hashValue
