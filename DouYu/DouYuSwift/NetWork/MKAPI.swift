//
//  MKAPI.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

    
    typealias NetWorkSucceed = (AFHTTPRequestOperation!,AnyObject!)->Void
    
    typealias NetWorkFailure = (AFHTTPRequestOperation!,NSError!)  ->Void
    
    class MKAPI: NSObject {
        
        /**
         POST
         
         - parameter url:     
         - parameter body:
         - parameter succeed:
         - parameter failed:
         */
        class func POST(url:String!,parameters:AnyObject?,succeed:NetWorkSucceed,failed:NetWorkFailure) {
            
            
            let mysucceed:NetWorkSucceed = succeed
            let myfailure:NetWorkFailure = failed
            SVProgressHUD.show()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            MKRequest.sharedInstance.POST(url, parameters: parameters, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                
             mysucceed(operation,responseObject)
                
             SVProgressHUD.dismiss()
             UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                }) {
                    (operation: AFHTTPRequestOperation?,error:NSError!) in
                    
                    myfailure(operation,error)
                    
                SVProgressHUD.showErrorWithStatus("加载失败")
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
            
        }
        /**
         Get
         
         - parameter url:
         - parameter body:
         - parameter succeed:
         - parameter failed:
         */
        class func GET(url:String!,parameters:AnyObject?,succeed:NetWorkSucceed,failed:NetWorkFailure) {
            
            let mysucceed:NetWorkSucceed = succeed
            let myfailure:NetWorkFailure = failed
            SVProgressHUD.show()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            MKRequest.sharedInstance.GET(url, parameters: parameters, success: {(operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                
                mysucceed(operation,responseObject)
                
                SVProgressHUD.dismiss()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                }) {
                    (operation: AFHTTPRequestOperation?,error:NSError!) in
                    
                    myfailure(operation,error)
                    
                SVProgressHUD.showErrorWithStatus("加载失败")
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
            
        }
        
        
}
        
        
        

