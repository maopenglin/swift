//
//  ColorTextLabel.swift
//  swiftView
//
//  Created by maopenglin on 14-6-10.
//  Copyright (c) 2014年 maopenglin. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import CoreText

/*

var labtxt:ColorTextLabel=ColorTextLabel()
labtxt.setText("中华人民共和国北京市海淀区上地环岛西",font:UIFont.systemFontOfSize(12),andColor:UIColor.blackColor())
labtxt.setKeyWordTextArray(["华","北"],font:UIFont.systemFontOfSize(12),color:UIColor.redColor())
labtxt.setKeyWordTextArray(["岛西"],font:UIFont.systemFontOfSize(18),color:UIColor.blueColor())
labtxt.frame=CGRect(x:30,y:330,width:170,height:30)
self.view.addSubview(labtxt)


var a="b"
println("\(object_getClassName(s))");
// NSString
*/
class ColorTextLabel:UILabel{
     var attribute:NSMutableAttributedString=NSMutableAttributedString()
  
    
    
    func setText(text:String,font:UIFont,andColor:UIColor){
        self.text=text
        var  len:Int=text.length;
        var mutaString:NSMutableAttributedString=NSMutableAttributedString(string:text)
        mutaString.addAttribute(String(kCTForegroundColorAttributeName),value:andColor.CGColor,range:NSMakeRange(0, len))
        var cs=font.familyName.cStringUsingEncoding(NSUTF8StringEncoding)
        var fontName:NSString=font.fontName
        var fontRef:CTFontRef=CTFontCreateWithName(fontName as CFString,font.pointSize,nil)
        mutaString.addAttribute(String(kCTFontAttributeName),value:fontRef,range:NSMakeRange(0, len))
        self.attribute=mutaString
    }
    func setKeyWordTextArray(arrText:NSArray,font:UIFont,color:UIColor){
        
        var someString: NSString = self.text
        var tabArray:NSMutableArray=NSMutableArray()
        for (var i=0;i<arrText.count;i++){
                var str:NSString=arrText[i] as NSString
                var range:NSRange=NSMakeRange(0, 0)
                var te=self.text.rangeOfString(str)
                range=someString.rangeOfString(str)
                var value:NSValue=NSValue(range:range)
                tabArray.addObject(value)
        }
        var fontName:NSString=font.fontName
        for (var i=0;i<tabArray.count;i++){
                var range:NSRange=tabArray[i].rangeValue
                attribute.addAttribute(String(kCTForegroundColorAttributeName),value:color.CGColor,range:range)
                var fontRef:CTFontRef=CTFontCreateWithName(fontName as CFString,font.pointSize,nil)
                attribute.addAttribute(String(kCTFontAttributeName),value:fontRef,range:range)
            }
    
    }
    override func drawRect(rect:CGRect){
            var context:CGContextRef=UIGraphicsGetCurrentContext();
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, 0.0, 0.0);
            CGContextScaleCTM(context, 1.0, -1.0);
            var framesetter:CTFramesetterRef = CTFramesetterCreateWithAttributedString(attribute as CFAttributedStringRef);
            var pathRef:CGMutablePathRef = CGPathCreateMutable();
            CGPathAddRect(pathRef,nil , CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
            var frame:CTFrameRef = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), pathRef,nil );
            CGContextTranslateCTM(context, 0, -self.bounds.size.height);
            CGContextSetTextPosition(context, 0, 0);
            CTFrameDraw(frame, context);
            CGContextRestoreGState(context);
            UIGraphicsPushContext(context);
    }
}
