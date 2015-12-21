//
//  myCell.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/20.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

    
    @IBOutlet var myimage: UIImageView!
    
    @IBOutlet var mytitle: UILabel!
    
    @IBOutlet var mySpecific: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
}
