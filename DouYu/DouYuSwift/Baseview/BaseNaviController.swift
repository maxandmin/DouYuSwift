//
//  BaseNaviController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class BaseNaviController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = RGBA(244, g: 89, b: 27, a: 1)
        self.navigationBar.tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.LightContent
    }
    
}
