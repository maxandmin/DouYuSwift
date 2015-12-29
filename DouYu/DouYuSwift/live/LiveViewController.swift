//
//  LiveViewController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//
/// 直播
import UIKit

class LiveViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var liveDateBase:LiveBaseClass!
    var liveArray:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        livedata()
        MainCollectionView()
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
        flowLayout.itemSize = CGSizeMake((ScreenWidth-15)/2, 120)
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
        CollectionView.registerNib(UINib(nibName: "RecommendCollectionCell", bundle:nil), forCellWithReuseIdentifier: "ReCell")
        
        return CollectionView
        
    }()
    

    
    //    MARK: - collectionView 方法
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if((liveArray) != nil){
            return liveArray.count
        }
        return 0
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:RecommendCollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("ReCell", forIndexPath: indexPath) as! RecommendCollectionCell
        let Rdate:LiveData = liveArray[indexPath.row] as! LiveData
        cell.liveCollmodel(Rdate)
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
        let PayDetails = PayDetailsViewController()
        self.presentViewController(PayDetails, animated: true, completion: nil)

    }
    
    
    func livedata(){
        let baseurl:String = LIVE_URl+GetNowTimes()
        MKAPI.GET(baseurl, parameters:"", succeed: livesuccess, failed: livefailed)
    }
    func livesuccess(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        
        liveDateBase = LiveBaseClass(dictionary:  responseObject as! [NSObject : AnyObject])
        liveArray = liveDateBase.data
        self.mycollview.reloadData()
    }
    func livefailed(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        print("失败了")
    }

}
