//
//  ProgramaCell.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/20.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class ProgramaCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var programaimg: UIImageView!
 
    @IBOutlet var gameName: UILabel!
    
    func programacollmodel(progdata:ProgramaData){
    
        gameName.text = progdata.gameName
    programaimg.sd_setImageWithURL(NSURL(string: progdata.gameIcon)!, placeholderImage: defaultImg)
        
    }
    
    
}
