//
//  RecommenSectionView.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/14.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class RecommenSectionView: UICollectionReusableView {

    
    @IBOutlet var Sectiontitle: UILabel!
    
    typealias moreBlock=(selectIndex:Int)->Void
    var selectmoreBlock = moreBlock?()
    
    
    func initBlock(Function:(selectIndex:Int)->Void ){
        selectmoreBlock = Function
    }

     func moreclick(sender: UITapGestureRecognizer) {
        
         selectmoreBlock!(selectIndex:(sender.view?.tag)!)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: "moreclick:")
        self.addGestureRecognizer(tap)
    }
    
}
