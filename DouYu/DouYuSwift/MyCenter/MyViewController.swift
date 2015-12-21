//
//  MyViewController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//
/// 个人中心
import UIKit

class MyViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate{

        var tableView   : UITableView?
        var imagearray = NSArray!()
        var txtarray = NSArray!()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        imagearray = NSArray()
        txtarray = NSArray()
        Createdata()
        maintebleview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func Createdata(){
        imagearray = ["image_my_message","image_my_remind","image_my_settings"]
        txtarray = ["站内私信","开播提醒","系统设置"]
    }
    
    func maintebleview(){
        
        self.tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.backgroundColor = RGBA(245, g: 245, b: 246, a: 1)
        self.view?.addSubview(self.tableView!)
        self.tableView!.registerNib(UINib(nibName: "myCell", bundle:nil), forCellReuseIdentifier: "settingcell")
        
        
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0){
        
            return 0
        }else if(section==1){
        
            return 3
        }
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0){
        
            return 180;
        }
        return 10
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
   
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section==0){
        
           let Heaberview = (NSBundle.mainBundle().loadNibNamed("mySceionview", owner: nil, options: nil)[0] as? mySceionview)
            return Heaberview
            
        }
        return nil
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let cell:myCell =  self.tableView!.dequeueReusableCellWithIdentifier("settingcell", forIndexPath: indexPath) as! myCell
        cell.myimage.image = UIImage(named: NSString(format: "%@",(imagearray[indexPath.row] as? String)!) as String)
        cell.mytitle.text = txtarray[indexPath.row] as? String
        if(indexPath.section == 2){
            cell.myimage.image = UIImage(named: "image_my_recommend")
            cell.mytitle.text = "手游中心"
            cell.mySpecific.hidden = false
            cell.mySpecific.text = "玩游戏领鱼丸"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
        
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView == self.tableView!){
            
        if (scrollView.contentOffset.y<=0){
                
            self.tableView?.scrollEnabled = false
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            
            }
             self.tableView?.scrollEnabled = true
        }
       
       
    }
    
}
