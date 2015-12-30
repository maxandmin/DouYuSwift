//
//  Helper.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/7.
//  Copyright © 2015年 maxin. All rights reserved.
//

import Foundation
import UIKit

let  ScreenBounds = UIScreen.mainScreen().bounds

let  ScreenHeight = UIScreen.mainScreen().bounds.size.height

let  ScreenWidth =  UIScreen.mainScreen().bounds.size.width

let  KWidth_Scale =  UIScreen.mainScreen().bounds.size.width/375.0

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)-> UIColor {return UIColor(colorLiteralRed: Float(r/255.0), green: Float(g/255.0), blue: Float(b/255.0), alpha:Float(a))}

// 默认图片
let defaultImg = UIImage(named: "Img_default")
// NSUserDefault
let userDefault = NSUserDefaults.standardUserDefaults()


 /// 顶部滚动视图
let TOP_URl  = "http://www.douyutv.com/api/v1/slide/6"
 ///  新秀
let NEW_URl  = "http://www.douyutv.com/api/v1/home_newbie_list?aid=ios&auth=3c0837ba99e8506db591b7971dfb20c2&client_sys=ios&time="

let NEW_Image_URl = "http://uc.douyutv.com/upload/avatar"

let NEW_Time_URl  = "_avatar_big.jpg?upt="
 /// 首页数据
let CHANEL_URl  = "http://www.douyutv.com/api/v1/channel?aid=ios&auth=6a4c6b01d851ceece76aee1980b9e5bb&client_sys=ios&limit=4&time="

 /// 栏目
let PROGRAMA_URl = "http://www.douyutv.com/api/v1/game?aid=ios&auth=3f252c3294b31a61fbdd890a45609549&client_sys=ios&time="

 /// 直播
let LIVE_URl = "http://www.douyutv.com/api/v1/live?aid=ios&auth=b317487532542c2f8200f374f3153da2&client_sys=ios&"



