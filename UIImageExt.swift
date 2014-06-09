//
//  PropertiesFileReading.swift
//  swiftView
//
//  Created by maopenglin on 14-6-9.
//  Copyright (c) 2014年 maopenglin. All rights reserved.
//

import Foundation
import UIKit
extension UIImage{

    func scaleToSize(size:CGSize)->UIImage{
        var width:Double=Double(CGImageGetWidth(self.CGImage));
        var height:Double=Double(CGImageGetHeight(self.CGImage));
        var verticalRadio:Double = Double(size.height)/Double(height)
        var horizontalRadio:Double=Double(size.width)/Double(width)
        var  radio:Double = 1;
        if(verticalRadio>1 && horizontalRadio>1)
        {
            radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
        }
        else
        {
            radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
        }
         width = width*radio;
        height = height*radio;
        var xPos:Double = (Double(size.width) - Double(width))/Double(2);
        var yPos:Double = (Double(size.height)-Double(height))/Double(2);
        UIGraphicsBeginImageContext(size);
        var rect:CGRect=CGRect(x:Float(xPos),y:Float(yPos),width:Float(width),height:Float(height))
        self.drawInRect(rect)
        var scaledImage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
      
    }
  
}