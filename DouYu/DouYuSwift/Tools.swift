//
//  Tools.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

/**
 得到当前时间
 
 - returns: 
 */
 func GetNowTimes()->String{

    let date = NSDate()
    let time = date.timeIntervalSince1970;
    let stringtime:String = NSString(format: "%i" , NSInteger(time)) as String
    return stringtime

}

