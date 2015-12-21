//
//  mySceionview.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/20.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class mySceionview: UIView {

    @IBOutlet var headimage: UIImageView!

    
    override func drawRect(rect: CGRect) {
        
        headimage.layer.masksToBounds = true
        headimage.layer.borderColor = UIColor.whiteColor().CGColor
        headimage.layer.borderWidth = 3
        headimage.layer.cornerRadius = headimage.bounds.size.width/2
       
    }
    
    
}
