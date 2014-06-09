//
//  AsyncImageView.swift
//  swiftView
//
//  Created by maopenglin on 14-6-9.
//  Copyright (c) 2014年 maopenglin. All rights reserved.
//

import Foundation
import UIKit

protocol AsyncImageDownLoadDelegate{
     func asyncImageDownLoadFinish(imageView:AsyncImageView)
     func asyncImageDownLoadFail(imageView:AsyncImageView)
}

class AsyncImageView:UIImageView{
  
    var urlConnection:NSURLConnection?
    
    var downloadData:NSMutableData?
    
    var defaultImage:UIImage?

    var saveUrl:String?
    
    var delegate:AsyncImageDownLoadDelegate?
    
    func loadFromUrl(url:String){
        if url.isEmpty{
            return
        }
        let turl:String=url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        if defaultImage{
           self.image=defaultImage
        }
        urlConnection?.cancel()
        var tmpUrl:String=turl
        tmpUrl=tmpUrl.replaceWithString("\\=",replace:"")
        tmpUrl=tmpUrl.replaceWithString("\\?",replace:"")
        tmpUrl=tmpUrl.replaceWithString("\\&",replace:"")
        tmpUrl=tmpUrl.replaceWithString("\\/",replace:"")
        tmpUrl=tmpUrl.replaceWithString("\\/", replace:"")
        tmpUrl=tmpUrl.replaceWithString("\\.", replace:"")
        tmpUrl=tmpUrl.replaceWithString("\\:",replace:"")
        tmpUrl=tmpUrl.replaceWithString("\\#",replace:"")
        
        self.saveUrl=tmpUrl
        
        
        var localCheck:UIImage?=self.createImageFromFile(tmpUrl)
        if localCheck{
            self.image=localCheck
            delegate?.asyncImageDownLoadFinish(self)
            return
        }
        
        self.downloadData=NSMutableData()
        var nsurl:NSURL=NSURL.URLWithString(turl)
        var request:NSURLRequest=NSURLRequest(URL:nsurl)
        self.urlConnection=NSURLConnection(request:request,delegate:self)
        
    }
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.downloadData!.appendData(data)
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!){
        if defaultImage{
            self.image=defaultImage
        }
        delegate?.asyncImageDownLoadFail(self)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        let finishImage:UIImage?=UIImage(data:self.downloadData)
        if finishImage{
              self.image=finishImage
            delegate?.asyncImageDownLoadFinish(self)
            self.saveCurrentImage()
        }else{
            if defaultImage{
                self.image=defaultImage
            }
            
             delegate?.asyncImageDownLoadFail(self)
        }
        
    }
    //////////////////////////////////////////////////////////////////////////////////////
    func createImageFromFile(fileName:String)->UIImage?{
        var pathArray:NSArray=NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path:String=pathArray.firstObject as String
            path=path+"/localhost/"
        var fileManager:NSFileManager=NSFileManager.defaultManager()
        fileManager.createDirectoryAtPath(path,attributes:nil)
        path=path+"/"+fileName
       
        if fileManager.fileExistsAtPath(path)
        {
           
            var image:UIImage=UIImage(contentsOfFile:path)
             return image
        }
        
       return nil
        
    }
    
    func saveCurrentImage(){
        var pathArray:NSArray=NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var path:String=pathArray.firstObject as String
        path=path+"/localhost/"
        var fileManager:NSFileManager=NSFileManager.defaultManager()
        fileManager.createDirectoryAtPath(path,attributes:nil)
        path=path+"/"+saveUrl!
        if fileManager.fileExistsAtPath(path)
        {
            fileManager.removeItemAtPath(path,error:nil)
        }
        var data:NSData=NSData(data:UIImagePNGRepresentation(self.image))
        data.writeToFile(path,atomically:true)
        
    }
}