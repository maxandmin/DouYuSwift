//
//  RecommendCollectionCell.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/9.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class RecommendCollectionCell: UICollectionViewCell {

    @IBOutlet var imageview: UIImageView!
    
    @IBOutlet var Title: UILabel!
    
    @IBOutlet var Name: UILabel!
    
    @IBOutlet var onlinePeople: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
    func RecCollModel(Rdate:RecGamelistRoomlist){
        Name.text = Rdate.nickname
        Title.text = Rdate.roomName
        Title.lineBreakMode=NSLineBreakMode.ByTruncatingTail
        if(Rdate.online<10000){
            onlinePeople.text = NSString(format:"%i",NSInteger(Rdate.online)) as String
        }else{
            let number = Rdate.online/10000;
             onlinePeople.text = NSString(format:"%.1f万",number) as String
        }
        imageview .sd_setImageWithURL(NSURL(string: Rdate.roomSrc)!, placeholderImage: defaultImg)
        
    }
    
    func liveCollmodel(Rdate:LiveData){
    
        Name.text = Rdate.nickname
        Title.text = Rdate.roomName
        Title.lineBreakMode=NSLineBreakMode.ByTruncatingTail
        if(Rdate.online<10000){
            onlinePeople.text = NSString(format:"%i",NSInteger(Rdate.online)) as String
        }else{
            let number = Rdate.online/10000;
            onlinePeople.text = NSString(format:"%.1f万",number) as String
        }
        imageview .sd_setImageWithURL(NSURL(string: Rdate.roomSrc)!, placeholderImage: defaultImg)

        
    }
    
}
