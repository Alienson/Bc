//
//  GameScene.swift
//  Parketovanie
//
//  Created by Adam Turna on 4.1.2016.
//  Copyright (c) 2016 Adam Turna. All rights reserved.
//

import SpriteKit
import Foundation

class GameScene: SKScene {
    var selectedNode = SKNode()
    
    var listOfParquets: [Parquet] = []
    let background = SKSpriteNode(imageNamed: "hracia_plocha_lvl1")
    var surfaceBackground = SKSpriteNode()
    var surf = Surface()
    var rotatePad = RotatePad(size: CGSize(width: 200, height: 200))
    
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
        makeRoratePad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
//        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("handlePanFrom:"))
//        self.view!.addGestureRecognizer(gestureRecognizer)
//        
        let doubleTap = UITapGestureRecognizer(target: self, action: "doubleTapped:")
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        panRec.addTarget(self, action: "panned:")
        panRec.maximumNumberOfTouches = 1
        self.view!.addGestureRecognizer(panRec)
    }
    
    func selectedObject(sender: UIPanGestureRecognizer) -> SKNode {
        var touchLocation: CGPoint = sender.locationInView(self.view!)
        touchLocation = self.convertPointFromView(touchLocation)
        let selectedNode = self.nodeAtPoint(touchLocation)
        return selectedNode
    }
    
    func panned(sender: UIPanGestureRecognizer) {
        let selectedNode = selectedObject(sender)
        if selectedNode.isKindOfClass(Parquet) {
            self.selectedNode = selectedNode
        }
        
        if sender.state == .Began {
            print("panned BEGAN")
            if let selectedParquet = self.selectedNode as? Parquet {
                selectedParquet.zPosition = 15
            }
        }
        if sender.state == .Changed {
            if let selectedParquet = self.selectedNode as? Parquet {
                var translation = sender.translationInView(sender.view!)
                translation = CGPoint(x: translation.x, y: -translation.y)
                let position = selectedParquet.position
                selectedParquet.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
                sender.setTranslation(CGPointZero, inView: sender.view)
                
                //umiestni node do stredu
                //self.selectedNode.position = CGPoint(x: surfaceBackground.frame.midX, y: surfaceBackground.frame.midY)
                
                //print("panned CHANGED")
            }
            
        }
        if sender.state == .Ended {
            print("panned ENDED")
            if let selectedParquet = self.selectedNode as? Parquet {
                selectedParquet.zPosition = 1
                if rotatePad.isOnPadPosition(selectedNode.position) && rotatePad.isPadEmpty {
                    print(rotatePad.isPadEmpty)
                    rotatePad.setParquetToPad(selectedParquet)
                    selectedParquet.position = rotatePad.midOfPad()
                }
                else {
                    selectedParquet.changeToBarPosition()
                }
            }
            deSelectNode()
        }
        
        //print(selectedNode.name)
    }
    
    func doubleTapped(sender: UIPanGestureRecognizer) {
        print("TAPPED")
        let selectedNode = selectedObject(sender)
        if selectedNode.isKindOfClass(Parquet) {
            print(selectedNode.name)
            //selectedNode.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            //selectedNode.runAction(SKAction.rotateByAngle(degToRad(90.0), duration: 0.1))
            //selectedNode.anchorPoint = CGPoint(x: 0, y: 0)
        }
    }
    
    
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }

    
    func deSelectNode() {
        self.selectedNode = SKSpriteNode()
    }
    
    
    
    func panForTranslation(translation : CGPoint) {
//        let position = selectedNode.position
//        if selectedNode.isMemberOfClass(Parquet){
//            print(selectedNode.name)
//            selectedNode.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
//        }
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
    
    func makeRoratePad() {
        addChild(rotatePad)
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
        let duo = Parquet(imageNamed: "2-duo")
        let trio = Parquet(imageNamed: "3-3I")
        let roztek = Parquet(imageNamed: "4-roztek")
        let stvorka = Parquet(imageNamed: "5-stvorka")
        let elko = Parquet(imageNamed: "6-elko")
        let elko_obratene = Parquet(imageNamed: "7-elko-obratene")
        
        mono.barPosition(CGPointMake(width / 4 - offset, offsetY+firstLineParquets))
        duo.barPosition(CGPointMake(width / 2, offsetY+firstLineParquets+25))
        trio.barPosition(CGPointMake(3 * width / 4 + offset, offsetY+firstLineParquets+50))
        roztek.barPosition(CGPointMake(width / 3 - offset, offsetY+secondLineParquets))
        stvorka.barPosition(CGPointMake(2 * width / 3 + offset, offsetY+secondLineParquets))
        elko.barPosition(CGPointMake(width / 3 - offset, offsetY))
        elko_obratene.barPosition(CGPointMake(2 * width / 3 + offset, offsetY))
        
        listOfParquets.append(mono)
        listOfParquets.append(duo)
        listOfParquets.append(trio)
        listOfParquets.append(roztek)
        listOfParquets.append(stvorka)
        listOfParquets.append(elko)
        listOfParquets.append(elko_obratene)
        
        for par in listOfParquets {
            par.movable = true
            background.addChild(par)
        }
    }

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        print("touch BEGAN")
        for touch in touches {
            let location = touch.locationInNode(self)
            print(nodeAtPoint(location).name)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //print("touch MOVED")
        for touch in touches {
            let location = touch.locationInNode(self)
            print(nodeAtPoint(location).name)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        print("touch ENDED")
        for touch in touches {
            let location = touch.locationInNode(self)
            print(nodeAtPoint(location).name)
        
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