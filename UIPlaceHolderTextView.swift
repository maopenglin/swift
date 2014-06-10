//
//  UIPlaceHolderTextView.swift
//  swiftView
//
//  Created by maopenglin on 14-6-9.
//  Copyright (c) 2014年 maopenglin. All rights reserved.
//

import Foundation
import UIKit

class UIPlaceHolderTextView:UITextView{
    
    var placeHolder:String?
    var placeHolderColor:UIColor?
    var tagName:String?
    @lazy var placeHolderLab:UILabel=UILabel()
    var tipFontSize:Float=12
    init(frame:CGRect,tipText:String){
        super.init(frame:frame,textContainer:nil)
         self.placeHolder=tipText
         self.placeHolderColor=UIColor.lightGrayColor()
        NSNotificationCenter.defaultCenter().addObserver(self,selector:"textChanged:",name:UITextViewTextDidChangeNotification,object:nil)
   }
    
   override func awakeFromNib()
    {
        super.awakeFromNib()
        self.placeHolder="评论限100字符以内"
        self.placeHolderColor=UIColor.lightGrayColor()
        NSNotificationCenter.defaultCenter().addObserver(self,selector:"textChanged:",name:UITextViewTextDidChangeNotification,object:nil)
    }
    func textChanged(notification:NSNotification?)
    {
        if self.placeHolder!.length==0 {
          return;
        }
    
        if self.text.length==0 {
            self.viewWithTag(999).alpha=1.0
        } else {
            self.viewWithTag(999).alpha=0.0
        }
    
    }
    func setText(text:String)
    {
        super.text=text
        self.textChanged(nil)
    }
    
    override func drawRect(rect:CGRect)
    {
        if self.placeHolder!.length>0 {
            self.placeHolderLab.frame=CGRect(x:8,y:6,width:self.bounds.size.width-16,height:0)
                self.placeHolderLab.text=self.placeHolder
                self.placeHolderLab.tag=999
                self.placeHolderLab.alpha=0
                self.placeHolderLab.textColor=self.placeHolderColor
                self.placeHolderLab.backgroundColor=UIColor.clearColor()
                self.placeHolderLab.font=UIFont.systemFontOfSize(self.tipFontSize)
                self.placeHolderLab.lineBreakMode=NSLineBreakMode.ByWordWrapping
                self.placeHolderLab.numberOfLines = 0
                self.addSubview(self.placeHolderLab)
        }
        self.placeHolderLab.sizeToFit()
        self.sendSubviewToBack(self.placeHolderLab)
        
        
        if self.text.length == 0 && self.placeHolder!.length>0 {
            self.viewWithTag(999).alpha=1.0
        }
        
        super.drawRect(rect)
    }

    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}