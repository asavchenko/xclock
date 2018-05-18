//
//  GameScene.swift
//  xclock
//
//  Created by Alexey Savchenko on 5/18/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
        private var lineSecond = SKShapeNode()
        private var lineHour = SKShapeNode()
        private var lineMinute = SKShapeNode()
        private var pointSecond: CGPoint
        private var pointMinute: CGPoint
        private var pointHour: CGPoint
        // angle seconds
        private var a: Float
        // angle minutes
        private var b: Float
        // angle hours
        private var c: Float
        private let d = 2 * Float.pi/60
        private var center: CGPoint
        private let len = 180
    
 
    override init (size: CGSize) {
        self.center = CGPoint(x: size.width/2, y: size.height/2)
        self.pointSecond = CGPoint(x: self.center.x, y: self.center.y + CGFloat(self.len))
        self.pointMinute = CGPoint(x: self.center.x, y: self.center.y + CGFloat(self.len))
        self.pointHour = CGPoint(x: self.center.x, y: self.center.y + CGFloat(self.len)/2)
        self.a = 0
        self.b = 0
        self.c = 0
        super.init(size: size)
        DispatchQueue.global(qos: .background).async {
            while (true) {
                self.rotateLines()
                sleep(1)
            }
        }
    }
    func rotateLines() {
        self.a = self.a + self.d
        self.b = self.b + self.d/60
        self.c = self.c + self.d/60/60
        
        while self.a > Float.pi * 2 {
            self.a = self.a - Float.pi * 2
        }
        while self.b > Float.pi * 2 {
            self.b = self.b - Float.pi * 2
        }
        while self.c > Float.pi * 2 {
            self.c = self.c - Float.pi * 2
        }
        self.pointSecond.x = self.center.x + CGFloat(self.len) * CGFloat(sin(self.a))
        self.pointSecond.y = self.center.y + CGFloat(self.len) * CGFloat(cos(self.a))
        
        self.pointMinute.x = self.center.x + CGFloat(self.len) * CGFloat(sin(self.b))
        self.pointMinute.y = self.center.y + CGFloat(self.len) * CGFloat(cos(self.b))
        
        self.pointHour.x = self.center.x + CGFloat(self.len)/2 * CGFloat(sin(self.c))
        self.pointHour.y = self.center.y + CGFloat(self.len)/2 * CGFloat(cos(self.c))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        func drawLineSecond(from: CGPoint, to: CGPoint){
            lineSecond.removeFromParent()
            let path = CGMutablePath()
            path.move(to: from)
            path.addLine(to: to)
            lineSecond = SKShapeNode(path: path)
            self.addChild(lineSecond)
        }
        
        func drawLineMinute(from: CGPoint, to: CGPoint){
            lineMinute.removeFromParent()
            let path = CGMutablePath()
            path.move(to: from)
            path.addLine(to: to)
            lineMinute = SKShapeNode(path: path)
            self.addChild(lineMinute)
        }
        
        func drawLineHour(from: CGPoint, to: CGPoint){
            lineHour.removeFromParent()
            let path = CGMutablePath()
            path.move(to: from)
            path.addLine(to: to)
            lineHour = SKShapeNode(path: path)
            self.addChild(lineHour)
        }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        drawLineSecond(from: self.center, to: self.pointSecond)
        drawLineMinute(from: self.center, to:  self.pointMinute)
        drawLineHour(from: self.center, to: self.pointHour)
    }
}
