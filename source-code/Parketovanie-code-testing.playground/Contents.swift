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

import UIKit

let large = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
let small = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
let point = CGPoint(x: 200, y: 200)
let convertedPoint = large.convertPoint(point, fromView: small)
//print(convertedPoint)




// Test convertPoint()
class GameScene: SKScene {
    override init(size: CGSize) {
        super.init(size: size)
        let background = SKSpriteNode(texture: nil, color: UIColor.blueColor(), size: CGSize(width: 200, height: 200))
        let node = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: CGSize(width: 50, height: 50))
        background.addChild(node)
        addChild(background)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GameViewController: UIViewController {
    
    var scene: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let skView = self.view as! SKView
        
        scene = GameScene(size: skView.bounds.size)
        
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }

}

GameViewController()






