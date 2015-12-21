//
//  channelView.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/10.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class channelView: UIView {

    
    @IBOutlet var imageview: UIImageView!
        {

        didSet{
            
            imageview.layer.masksToBounds = true
            imageview.layer.cornerRadius  = 10
        }
    }
    
    @IBOutlet var channeltitle: UILabel!


}
