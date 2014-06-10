//
//  UITextFieldSharkExt.swift
//  swiftView
//
//  Created by maopenglin on 14-6-10.
//  Copyright (c) 2014年 maopenglin. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension  UITextField{
    func shark(){
        var keyAn:CAKeyframeAnimation=CAKeyframeAnimation(keyPath:"position");
         keyAn.duration=0.5
       
        var pointArray:NSMutableArray=NSMutableArray()
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x,self.center.y)))
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x-5,self.center.y)))
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x+5,self.center.y)))
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x,self.center.y)))
        
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x-5,self.center.y)))
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x+5,self.center.y)))
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x,self.center.y)))

        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x-5,self.center.y)))
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x+5,self.center.y)))
        pointArray.addObject(NSValue(CGPoint:CGPointMake(self.center.x,self.center.y)))

        
        keyAn.values=pointArray
        
         var timeArray:NSMutableArray=NSMutableArray()
         timeArray.addObject(Float(0.1))
         timeArray.addObject(Float(0.2))
         timeArray.addObject(Float(0.3))
         timeArray.addObject(Float(0.4))
         timeArray.addObject(Float(0.5))
         timeArray.addObject(Float(0.6))
         timeArray.addObject(Float(0.7))
         timeArray.addObject(Float(0.8))
         timeArray.addObject(Float(0.9))
         timeArray.addObject(Float(1.0))
        
         keyAn.keyTimes=timeArray
        self.layer.addAnimation(keyAn,forKey:"TextAnim")
        
    }
}