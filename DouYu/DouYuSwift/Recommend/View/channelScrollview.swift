//
//  channelScrollview.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/11.
//  Copyright © 2015年 maxin. All rights reserved.
//


import UIKit

class channelScrollview: UIScrollView {


 
    
    var cview:channelView?
    
    
    typealias ImageBlock=(selectIndex:Int)->Void
    var selectImageBlock = ImageBlock?()
    
    
    func initBlock(Function:(selectIndex:Int)->Void ){
        selectImageBlock = Function
    }
    

    
    
    func setchannelScroll(recDateArray:NSArray)->UIScrollView{
    
        for var i = 0; i < recDateArray.count; ++i{
            let Rdate:RecommendData = recDateArray[i] as! RecommendData
            cview = (NSBundle.mainBundle().loadNibNamed("channelView", owner: nil, options: nil)[0] as? channelView)!
            cview!.frame = CGRectMake(CGFloat(5+5*i+106*i), 0, (ScreenWidth)/3, 80)
            cview!.imageview.sd_setImageWithURL(NSURL(string:Rdate.roomSrc)!, placeholderImage: defaultImg)
            cview!.channeltitle.text = Rdate.gameName
            let tap = UITapGestureRecognizer()
            tap.addTarget(self, action: "channelClick:")
            cview!.addGestureRecognizer(tap)
            cview!.tag = i+1
            self.addSubview(cview!)
        }
        
        return self
    }

    @IBAction func channelClick(sender: UITapGestureRecognizer) {
        
        selectImageBlock!(selectIndex:(sender.view?.tag)!)
    }

}
