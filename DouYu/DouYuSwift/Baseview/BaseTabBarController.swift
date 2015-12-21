//
//  BaseTabBarController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //替换系统的tababr
//        Replace()
        self.tabBar.tintColor = RGBA(244, g: 89, b: 27, a: 1)
        initChildViewControllers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func Replace(){
    
        let TabBarView = UIView()
        TabBarView.frame = self.view.frame
        self.tabBar .insertSubview(TabBarView, atIndex: 0)
        self.tabBar.opaque =  true
         self.tabBar.tintColor = RGBA(244, g: 89, b: 27, a: 1)
    }
    
    func initChildViewControllers(){
    
    let NavRecommend = BaseNaviController(rootViewController: RecommendViewController())
    let NavPrograma = BaseNaviController(rootViewController:  ProgramaViewController())
    let NavLiveView = BaseNaviController(rootViewController: LiveViewController())
    let NavMyView = BaseNaviController(rootViewController: MyViewController())
    let TabbarArray=[NavRecommend,NavPrograma,NavLiveView,NavMyView];
   
    var itemNameArray:[String] = ["btn_home_normal","btn_column_normal","btn_live_normal","btn_user_normal"];
    var itemNameSelectArray:[String] = ["btn_home_selected","btn_column_selected","btn_live_selected","btn_user_selected"];
    var ItemTitle:[String] = ["推荐","栏目","直播","我的"];
    let Tabbar=UITabBarController();
    Tabbar.viewControllers = TabbarArray;
    var count:Int = 0;
    let items = Tabbar.tabBar.items;
    let attributes =  [NSForegroundColorAttributeName: UIColor.orangeColor(), NSFontAttributeName: UIFont(name: "Heiti SC", size: 15.0)!];
    for item in items! as [UITabBarItem] {
            var image:UIImage = UIImage(named: itemNameArray[count])!
            var selectedimage:UIImage = UIImage(named: itemNameSelectArray[count])!
            image = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            selectedimage = selectedimage.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            item.selectedImage = selectedimage
            item.image = image
            item.title = ItemTitle[count]
            TabbarArray[count].tabBarItem=item
            item.setTitleTextAttributes(attributes , forState: UIControlState.Selected)
            count++;
        }
        let tabwindow = UIApplication.sharedApplication().delegate?.window
        tabwindow!!.backgroundColor = UIColor.whiteColor();
        tabwindow!!.rootViewController=Tabbar;
        tabwindow!!.makeKeyAndVisible();
        
    }
    
}
