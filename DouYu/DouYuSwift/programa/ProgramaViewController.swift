//
//  ProgramaViewController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//
/// 栏目
import UIKit
import Foundation

class ProgramaViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var ProgramaBase:ProgramaBaseClass!
    var programaArray:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCollectionView()
        programaData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //       MARK: maincoll
    
    func MainCollectionView(){
        let maincoll:UICollectionView = self.mycollview
        self.view.addSubview(maincoll)
    }
    
    lazy var mycollview:UICollectionView={
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake((ScreenWidth-20)/3, 150)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical//设置垂直显示
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)//设置边距
        flowLayout.minimumLineSpacing = 5;//每个相邻layout的上下
        flowLayout.minimumInteritemSpacing = 0;//每个相邻layout的左右
        flowLayout.headerReferenceSize = CGSizeMake(0, 0);
        var CollectionView = UICollectionView(frame: CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height-64-49), collectionViewLayout: flowLayout)
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.backgroundColor = RGBA(245, g: 245, b: 246, a: 1)
        CollectionView.alwaysBounceVertical = true
        CollectionView.registerNib(UINib(nibName: "ProgramaCell", bundle:nil), forCellWithReuseIdentifier: "progcell")
        return CollectionView
        
    }()
    
    
    
    
    
    //    MARK: - collectionView 方法
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if((programaArray) != nil){
         return programaArray.count
            
        }
       
        return 0
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:ProgramaCell = collectionView.dequeueReusableCellWithReuseIdentifier("progcell", forIndexPath: indexPath) as! ProgramaCell
        let progdata:ProgramaData = programaArray[indexPath.row] as! ProgramaData
        cell.programacollmodel(progdata)
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
    }
    
// MARK - 获取栏目数据
    func programaData(){
    
        let baseurl:String = PROGRAMA_URl+GetNowTimes()
        MKAPI.GET(baseurl, parameters:"", succeed: programasuccess, failed: programafailed)
    }
    func programasuccess(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
  
        ProgramaBase = ProgramaBaseClass(dictionary:  responseObject as! [NSObject : AnyObject])
        programaArray = ProgramaBase.data
        self.mycollview.reloadData()
        
    }
    func programafailed(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        print("失败了")
    }

}
