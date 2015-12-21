//
//  MKRequest.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class MKRequest: AFHTTPRequestOperationManager {

    class var sharedInstance :MKRequest {
        struct Static {
            static var onceToken:dispatch_once_t = 0
            static var instance:MKRequest? = nil
        }
        
        dispatch_once(&Static.onceToken, { () -> Void in
            
            //在这里设置你的baseURl
            let url:NSURL = NSURL(string: "")!
            Static.instance = MKRequest(baseURL: url)
        })
        return Static.instance!
        
    }
    
}
