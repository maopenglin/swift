//
//  UIViewExt.swift
//  swiftView
//
//  Created by maopenglin on 14-6-9.
//  Copyright (c) 2014年 maopenglin. All rights reserved.
//

import Foundation
import UIKit

extension UIView{

    func imageFromView()->UIImage{
         UIGraphicsBeginImageContextWithOptions(self.bounds.size,false,Float(UIScreen.mainScreen().scale))
         self.layer.renderInContext(UIGraphicsGetCurrentContext())
         var finalImage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
         UIGraphicsEndImageContext();
         return finalImage;

    }
  
}