//
//  BaseViewController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/7.
//  Copyright © 2015年 maxin. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.whiteColor()
        NewNabvar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.hidesBottomBarWhenPushed = false
    }
    
    /**
    创建Navbar
    */
    
    func NewNabvar(){
        
        let leftButton=UIBarButtonItem(title:"",style:.Plain,target:self,action:"Scan")
        leftButton.image = UIImage(named: "Image_scan")
        self.navigationItem.leftBarButtonItem = leftButton
        
        let rightButton=UIBarButtonItem(title:"",style:.Plain,target:self,action:"Search")
        rightButton.image = UIImage(named: "btn_search")
        self.navigationItem.rightBarButtonItem = rightButton
        
        let LogoImageiew = UIImageView(frame: CGRectMake(0, 0, 104, 28))
        LogoImageiew.image = UIImage(named: "logo")
        self.navigationItem.titleView = LogoImageiew
        
    }
    
    func Scan(){
    
        
    }
    
    
    func Search(){
    
        
    }
    
}
