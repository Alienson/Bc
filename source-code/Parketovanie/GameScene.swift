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
    
    let background = SKSpriteNode(imageNamed: "hracia_plocha_lvl1")
    //var surfaceBackground = SKSpriteNode()
    var surfaceBack: SurfaceBackground?
    var surface: Surface?
    //var rotatePad = RotatePad(size: CGSize(width: 200, height: 200), level: 1, parent: background)
    var rotatePad: RotatePad?
    var leftBar: LeftBar?
    
    let panRec = UIPanGestureRecognizer()
    
    var arrayOfFrameControlledObjects = [FrameController]()
    
    var level = Level()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.background.name        = "background"
        self.background.position    = CGPoint(x: 0, y: 0)
        self.background.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(self.background)
        
        makeleftBar(1)
        makeSurface(1)
        makeRoratePad(1)
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
        
        
        if sender.state == .Began {
            print("panned BEGAN")
            if let selectedParquet = selectedNode as? Parquet {
                self.selectedNode = selectedNode
                selectedParquet.zPosition = 15
                selectedParquet.addLastPosition(selectedParquet.position)
            }
        }
        if sender.state == .Changed {
            if let selectedParquet = self.selectedNode as? Parquet {
                var translation = sender.translationInView(sender.view!)
                translation = CGPoint(x: translation.x, y: -translation.y)
                let position = selectedParquet.position
                //selectedParquet.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
                selectedParquet.translatePosition(translation)
                sender.setTranslation(CGPointZero, inView: sender.view)
                
                //print("menim")
                //let surf = self.surface
                //print(surf.surface.convertPoint(CGPointZero, toNode: self))
                //print(surf.surface.frame.origin.x+280, surf.surface.frame.origin.y+176)
                //print(surf.surface.convertPoint(CGPointZero, toNode: surf.surfaceBackground.frame.origin))
                print(selectedParquet.name ,selectedParquet.position)
                
                
                //umiestni node do stredu
                //self.selectedNode.position = CGPoint(x: surfaceBackground.frame.midX, y: surfaceBackground.frame.midY)
                
                //print("panned CHANGED")
            }
            
        }
        if sender.state == .Ended {
            print("panned ENDED")
            if let selectedParquet = self.selectedNode as? Parquet {
                var findControlledFrame = false
                for object in arrayOfFrameControlledObjects {
                    if object.isOnFramePosition(selectedParquet.position) {
                        findControlledFrame = true
                        if let rPad = object as? RotatePad {
                            if rPad.isPadEmpty {
                                rPad.pinParquetToPad(selectedParquet)
                                selectedParquet.changePosition(rPad.midOfFrame())
                            }
                            else if !rPad.isPadEmpty && selectedParquet == rPad.catchedParquet {
                                selectedParquet.changePosition(rPad.midOfFrame())
                            }
                            else {
                                rPad.unpinParquetFromPad()
                                selectedParquet.changeToBarPosition()
                            }
                        }
                        //selectedParquet.changePosition(object.midOfFrame())
                    }
                }
                if !findControlledFrame {
                    selectedParquet.changeToBarPosition()
                }
//                if let rotatePad = self.rotatePad {
//                    if let surface = self.surface {
//                        if rotatePad.isOnFramePosition(selectedParquet.position) {
//                            if rotatePad.isPadEmpty {
//                                rotatePad.pinParquetToPad(selectedParquet)
//                                selectedParquet.position = rotatePad.midOfFrame()
//                            }
//                            else if !rotatePad.isPadEmpty && selectedParquet == rotatePad.catchedParquet {
//                                selectedParquet.position = rotatePad.midOfFrame()
//                            }
//                            else {
//                                rotatePad.unpinParquetFromPad()
//                                selectedParquet.changeToBarPosition()
//                            }
//                        }
//                        else if surface.isOnFramePosition(selectedParquet.position) {
//                            print("is on surface")
//                            selectedParquet.position = surface.midOfFrame()
//                        }
//                        else {
//                            rotatePad.unpinParquetFromPad()
//                            selectedParquet.changeToBarPosition()
//                        }
//                    }
//                }
                
            }
            deSelectNode()
        }
        
        //print(selectedNode.name)
    }
    
    func doubleTapped(sender: UIPanGestureRecognizer) {
        print("double TAPPED")
        let selectedNode = selectedObject(sender)
        if let selectedParquet = selectedNode as? Parquet {
            
            print(selectedParquet.name)
            if selectedParquet.rotatable {
                selectedParquet.runAction(SKAction.rotateByAngle(degToRad(90.0), duration: 0.1))
            }
        }
    }
    
    func deSelectNode() {
        self.selectedNode.zPosition = 1
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
    
    func makeSurface(levelNumber: Int) {
        self.surfaceBack = SurfaceBackground(parent: self.background, levelNumber: levelNumber)
        addChild(self.surfaceBack!)
        self.surface = Surface(rows: 6, collumns: 5, parent: self.background, background: self.surfaceBack!)
        addChild(self.surface!)
        print(self.surface!.position)
        arrayOfFrameControlledObjects.append(self.surface!)
        
    }
    
    func makeRoratePad(levelNumber: Int) {
        self.rotatePad = RotatePad(size: CGSize(width: 200, height: 200), level: levelNumber, parent: background)
        addChild(self.rotatePad!)
        arrayOfFrameControlledObjects.append(self.rotatePad!)
    }
    
    func makeleftBar(levelNumber: Int) {
        //height prerobit
        //self.leftBar = LeftBar(size: CGSize(width: 280, height: background.size.height), level: levelNumber, parent: background)
        self.leftBar = LeftBar(size: CGSize(width: 280, height: 500), level: levelNumber, parent: background)
        addChild(self.leftBar!)
        print(self.leftBar?.anchorPoint)
        //arrayOfFrameControlledObjects.append(self.leftBar!)
    }
    
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//       /* Called when a touch begins */
//        print("touch BEGAN")
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            print(nodeAtPoint(location).name)
//        }
//    }
//    
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        //print("touch MOVED")
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            print(nodeAtPoint(location).name)
//        }
//    }
//    
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        /* Called when a touch begins */
//        print("touch ENDED")
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            print(nodeAtPoint(location).name)
//        
//        }
//    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }
}