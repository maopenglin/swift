//
//  StringExt.swift
//  testfun
//
//  Created by maopenglin on 14-6-6.
//  Copyright (c) 2014年 maopenglin. All rights reserved.
//

import Foundation

extension String{
  
    //字符串替换
    func replaceWithString(str:String,replace:String)->String{
      
        var partten:String=str
        var range:NSRange=NSRange(location:0,length:self.length)
        var option:NSMatchingOptions=NSMatchingOptions(0)
        var find:NSRegularExpression=NSRegularExpression.regularExpressionWithPattern(partten,options:.CaseInsensitive,error:nil)
        var s=find.stringByReplacingMatchesInString(self,options:option,range:range,withTemplate:replace)
        return s
    }
    var isEmpty:Boolean{
        get{
            return self.isEmpty
        }
    }
    //字符串截取
    func subString(from: Int, length: Int) -> String {
        let intermediate = self.substringFromIndex(from)
        var localLenghth:Int=length
        if length>self.length{
            localLenghth=self.length
        }
        
        return intermediate.substringToIndex(localLenghth)
    }
    
    func equal(target:String)->Bool{
          return self==target
    }
   
    func startWith(prefix:String)->Bool{
       return  self.hasPrefix(prefix)
    }
    func endWith(prefix:String)->Bool{
        return  self.hasSuffix(prefix)
    }
    //查找汉字 对应的 字母位置
    func getIndexWithZhCnPosition(position:Double)->Int{
    
        var i:Int=0
        var length:Double=0
        var abc=String[]()
        abc.append("a")
        abc.append("b")
        abc.append("c")
        abc.append("d")
        abc.append("e")
        abc.append("f")
        abc.append("g")
        abc.append("h")
        abc.append("i")
        abc.append("j")
        abc.append("k")
        abc.append("l")
        abc.append("m")
        abc.append("n")
        abc.append("o")
        abc.append("p")
        abc.append("q")
        abc.append("r")
        abc.append("s")
        abc.append("t")
        abc.append("u")
        abc.append("v")
        abc.append("w")
        abc.append("x")
        abc.append("y")
        abc.append("z")
        abc.append("0")
        abc.append("1")
        abc.append("2")
        abc.append("3")
        abc.append("4")
        abc.append("5")
        abc.append("6")
        abc.append("7")
        abc.append("8")
        abc.append("9")
        abc.append("!")
        abc.append("@")
        abc.append("#")
        abc.append("$")
        abc.append("^")
        abc.append("*")
        abc.append("&")
        abc.append("(")
        abc.append(")")
        abc.append("_")
        abc.append("=")
        
        
        for sc in self{
            let s:String = String(sc).lowercaseString
            var l:Double=0.0
            var b:Bool=false
            for ab in abc {
                let tab=String(ab).lowercaseString
                if s==tab{
                    b=true
                    break
                }
            }
            i=i+1
            if b{
                length=length+0.5
            }else{
                length=length+1
            }
            if length==position{
               return i
            }
        }
        return i
    
    }
    
    //统计字符串长度
    var length:Int{
       get{
          return countElements(self)
      }
    }
    //统计汉字  2个字母 算一个 汉字
    var lengthZhCn:Double{
        get{
            var length:Double=0
            var abc=String[]()
            abc.append("a")
            abc.append("b")
            abc.append("c")
            abc.append("d")
            abc.append("e")
            abc.append("f")
            abc.append("g")
            abc.append("h")
            abc.append("i")
            abc.append("j")
            abc.append("k")
            abc.append("l")
            abc.append("m")
            abc.append("n")
            abc.append("o")
            abc.append("p")
            abc.append("q")
            abc.append("r")
            abc.append("s")
            abc.append("t")
            abc.append("u")
            abc.append("v")
            abc.append("w")
            abc.append("x")
            abc.append("y")
            abc.append("z")
            abc.append("0")
            abc.append("1")
            abc.append("2")
            abc.append("3")
            abc.append("4")
            abc.append("5")
            abc.append("6")
            abc.append("7")
            abc.append("8")
            abc.append("9")
            abc.append("!")
            abc.append("@")
            abc.append("#")
            abc.append("$")
            abc.append("^")
            abc.append("*")
            abc.append("&")
            abc.append("(")
            abc.append(")")
            abc.append("_")
            abc.append("=")
            for sc in self{
                let s:String = String(sc).lowercaseString
                var l:Double=0.0
                var b:Bool=false
                for ab in abc {
                    let tab=String(ab).lowercaseString
                    if s==tab{
                       b=true
                        break
                    }
                }
                if b{
                    length=length+0.5
                }else{
                    length=length+1
                }
           }
         
            return length
        }
    }
    
}