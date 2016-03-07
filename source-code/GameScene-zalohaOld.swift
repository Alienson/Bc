//
//  GameScene.swift
//  Parketovanie
//
//  Created by Adam Turna on 4.1.2016.
//  Copyright (c) 2016 Adam Turna. All rights reserved.
//

import SpriteKit
import Foundation


private let movableString = "movable"

class GameScene: SKScene {
    
    var listOfParquets: [Parquet] = []
    var selectedNode = SKSpriteNode()
    let background = SKSpriteNode(imageNamed: "hracia_plocha_lvl1")
    var surfaceBackground = SKSpriteNode()
    var surf = Surface()
    
    let panRec = UIPanGestureRecognizer()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.background.name = "background"
        self.background.position     = CGPoint(x: 0, y: 0)
        self.background.anchorPoint  = CGPoint(x: 0, y: 0)
        addChild(self.background)
        
        leftBarlvl1()
        makeSurface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePanFrom:"))
        self.view!.addGestureRecognizer(gestureRecognizer)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: "doubleTapped")
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
//        panRec.addTarget(self, action: "panned:")
//        panRec.maximumNumberOfTouches = 1
//        self.view!.addGestureRecognizer(panRec)
    }
    
    func panned(sender: UIPanGestureRecognizer){
        var touchLocation: CGPoint = sender.locationInView(self.view!)
        touchLocation = self.convertPointFromView(touchLocation)
    }
    
    func doubleTapped() {
        if selectedNode.name == "parquet" {
            print(selectedNode.name)
            //selectedNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            selectedNode.runAction(SKAction.rotateByAngle(degToRad(90.0), duration: 0.1))
            //selectedNode.anchorPoint = CGPoint(x: 0, y: 0)
        }
    }
    
    func handlePanFrom(recognizer : UIPanGestureRecognizer) {
        if recognizer.state == .Began {
            var touchLocation = recognizer.locationInView(recognizer.view)
            touchLocation = self.convertPointFromView(touchLocation)
            
            self.selectNodeForTouch(touchLocation)
            print("began \(touchLocation)")
        } else if recognizer.state == .Changed {
            var translation = recognizer.translationInView(recognizer.view!)
            translation = CGPoint(x: translation.x, y: -translation.y)
            
            self.panForTranslation(translation)
            
            recognizer.setTranslation(CGPointZero, inView: recognizer.view)
            print("changed")
        } else if recognizer.state == .Ended {
            print("ended")
            if selectedNode.name != "parquet" {
                print("tu")
//                let scrollDuration = 0.2
//                let velocity = recognizer.velocityInView(recognizer.view)
//                let pos = selectedNode.position
//                
//                // This just multiplies your velocity with the scroll duration.
//                let p = CGPoint(x: velocity.x * CGFloat(scrollDuration), y: velocity.y * CGFloat(scrollDuration))
//                
//                var newPos = CGPoint(x: pos.x + p.x, y: pos.y + p.y)
//                newPos = self.boundLayerPos(newPos)
//                selectedNode.removeAllActions()
//                
//                let moveTo = SKAction.moveTo(newPos, duration: scrollDuration)
//                moveTo.timingMode = .EaseOut
//                selectedNode.runAction(moveTo)
            }
        }
    }
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }
    
    func selectNodeForTouch(touchLocation : CGPoint) {
        // 1
        let touchedNode = self.nodeAtPoint(touchLocation)
        
        if touchedNode.name == "parquet" {
            // 2
            if !selectedNode.isEqual(touchedNode) {
                selectedNode.removeAllActions()
                
                selectedNode = touchedNode as! SKSpriteNode
            }
            else {
                selectedNode = SKSpriteNode()
            }
        }
    }
    
    func deSelectNodeForTouch(touchLocation : CGPoint) {
        selectedNode = SKSpriteNode()
    }
    
    
    
    func panForTranslation(translation : CGPoint) {
        let position = selectedNode.position
        if selectedNode.isMemberOfClass(Parquet){
            print(selectedNode.name)
            selectedNode.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
        }
    }
    
    func boundLayerPos(aNewPosition : CGPoint) -> CGPoint {
        let winSize = self.size
        var retval = aNewPosition
        retval.x = CGFloat(min(retval.x, 0))
        retval.x = CGFloat(max(retval.x, -(background.size.width) + winSize.width))
        retval.y = self.position.y
        
        return retval
    }
    
    func makeSurface() {
        surfaceBackground = SKSpriteNode(texture: nil, color: UIColor.purpleColor(), size: CGSize(width: 743, height: 550))
        surfaceBackground.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        surfaceBackground.name = "surfaceBackground"
        surfaceBackground.position = CGPoint(x: 280, y: 176)
        surfaceBackground.alpha = CGFloat(0.5)
        addChild(surfaceBackground)
        self.surf = Surface(rows: 3, collumns: 4, parent: surfaceBackground)
        
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
        let width = CGFloat(280)
        let firstLineParquets = CGFloat(250)
        let secondLineParquets = CGFloat(150)
//        _ = leftBar.size.height
//        let width = leftBar.size.width
        
        
        
        let mono = Parquet(imageNamed: "1-mono")
        mono.position       = CGPointMake(width / 4 - offset, offsetY+firstLineParquets)
        mono.anchorPoint    = CGPoint(x: 0.5, y: 0.5)
        
        let duo = Parquet(imageNamed: "2-duo")
        duo.position        = CGPointMake(width / 2, offsetY+firstLineParquets+25)
        duo.anchorPoint     = CGPoint(x: 0.5, y: 0.5)
        
        let trio = Parquet(imageNamed: "3-3I")
        trio.position       = CGPointMake(3 * width / 4 + offset, offsetY+firstLineParquets+50)
        trio.anchorPoint    = CGPoint(x: 0.5, y: 0.5)
        
        let roztek = Parquet(imageNamed: "4-roztek")
        roztek.position     = CGPointMake(width / 3 - offset, offsetY+secondLineParquets)
        roztek.anchorPoint  = CGPoint(x: 0.5, y: 0.5)
        
        let stvorka = Parquet(imageNamed: "5-stvorka")
        stvorka.position    = CGPointMake(2 * width / 3 + offset, offsetY+secondLineParquets)
        stvorka.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let elko = Parquet(imageNamed: "6-elko")
        elko.position       = CGPointMake(width / 3 - offset, offsetY)
        elko.anchorPoint    = CGPoint(x: 0.5, y: 0.5)
        
        let elko_obratene = Parquet(imageNamed: "7-elko-obratene")
        elko_obratene.position    = CGPointMake(2 * width / 3 + offset, offsetY)
        elko_obratene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        listOfParquets.append(mono)
        listOfParquets.append(duo)
        listOfParquets.append(trio)
        listOfParquets.append(roztek)
        listOfParquets.append(stvorka)
        listOfParquets.append(elko)
        listOfParquets.append(elko_obratene)
        
        for par in listOfParquets {
            par.movable = true
            par.zPosition = 0
            background.addChild(par)
        }
    }

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.zPosition = 15
            
            //let liftUp = SKAction.scaleTo(1.2, duration: 0.2)
            //touchedNode.runAction(liftUp, withKey: "pickup")
            selectNodeForTouch(location)
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = nodeAtPoint(location)
            touchedNode.zPosition = 0
            
            //let dropDown = SKAction.scaleTo(1.0, duration: 0.2)
            touchedNode.position.x = touchedNode.position.x - touchedNode.position.x % 10
            //point.x - point.x % 10
            touchedNode.position.y = touchedNode.position.y - touchedNode.position.y % 10
            //touchedNode.runAction(dropDown, withKey: "drop")
            //print(touchedNode.position)
            deSelectNodeForTouch(location)
        
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            
            
            deSelectNodeForTouch(location)
            //selectedNode = SKSpriteNode()
        }
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

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