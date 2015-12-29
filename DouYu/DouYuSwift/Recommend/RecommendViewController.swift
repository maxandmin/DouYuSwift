//
//  RecommendViewController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/8.
//  Copyright © 2015年 maxin. All rights reserved.
//
/// 推荐
import UIKit
import Foundation

class RecommendViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate {
    
    var TopBase:RecTopBaseClass!
    var RecBase:RecommendBaseClass!
    var RecGame:RecGamelistBaseClass!
    var imageArray:NSMutableArray!
    var titleArray:NSMutableArray!
    var footArray:NSArray!
    var gameArray:NSArray!
    var topView:UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = NSMutableArray()
        titleArray = NSMutableArray()
        LoadTopData()
        LoadmainData()
        loadGamelist()
        MainCollectionView()
     
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //       MARK: maincoll
    func MainCollectionView(){
      let maincoll:UICollectionView = self.mycollview
      self.view.addSubview(maincoll)
       topview()
//      maincoll.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction:"mainrefresh")
       
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
        CollectionView.contentInset = UIEdgeInsetsMake(270, 0, 0, 0);//设置偏移
        CollectionView.contentOffset.x = 0
        CollectionView.contentOffset.y = -270
        CollectionView.registerNib(UINib(nibName: "RecommendCollectionCell", bundle:nil), forCellWithReuseIdentifier: "ReCell")
        CollectionView.registerNib(UINib(nibName:"RecommenSectionView", bundle: nil), forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier:"sectionview")
        
        return CollectionView
        
    }()
    
    
    
//    MARK: - CollectionView头的背景view
    func topview(){
        topView = UIView()
        topView!.frame = CGRectMake(0, -270, ScreenWidth, 270)
        topView!.backgroundColor  = RGBA(245, g: 245, b: 246, a: 1)
        self.mycollview.addSubview(topView!)
        topHeaderview()
        footScrollview()
        
    }
    
//     MARK: - 轮播图
    func topHeaderview(){
       
        topView!.addSubview(self.myTopHeaderView)
    }
    
    lazy var myTopHeaderView:SDCycleScrollView={
    
        let TopHeaderView:SDCycleScrollView = SDCycleScrollView(frame: CGRectMake(0, 0, ScreenWidth, 200*KWidth_Scale))
        TopHeaderView.delegate = self
        TopHeaderView.placeholderImage = defaultImg
        TopHeaderView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        TopHeaderView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        TopHeaderView.titleLabelTextFont = UIFont.systemFontOfSize(17)
        TopHeaderView.backgroundColor  = RGBA(245, g: 245, b: 246, a: 1)
        return TopHeaderView
    }()
    
//      MARK: - 滑块的视图
    func footScrollview(){
        self.myfootScroll.contentSize.height = 80
        self.myfootScroll.backgroundColor=UIColor.whiteColor()
        topView!.addSubview(self.myfootScroll)
        
    }
    
    lazy var myfootScroll:channelScrollview={
    
        let  footScroll = channelScrollview()
        footScroll.frame = CGRectMake(0,200*KWidth_Scale+10,ScreenWidth,80)
        footScroll.backgroundColor = RGBA(245, g: 245, b: 246, a: 1)
        footScroll.showsHorizontalScrollIndicator = false
        footScroll.showsVerticalScrollIndicator   = false
        footScroll.backgroundColor = RGBA(245, g: 245, b: 246, a: 1)
        footScroll.initBlock({(selectIndex) -> Void in
            
            print(selectIndex)
            
        })
        return footScroll

        
    }()
    
    
    //    MARK: - collectionView 方法
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        let collArray:RecGamelistData = gameArray[section] as! RecGamelistData
        return collArray.roomlist.count;
      
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        if((gameArray) != nil){
            return gameArray.count
        }
        return 0
    }
    
     func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
         let headerView:RecommenSectionView = collectionView.dequeueReusableSupplementaryViewOfKind("UICollectionElementKindSectionHeader", withReuseIdentifier:"sectionview", forIndexPath: indexPath)as! RecommenSectionView
             
             let collArray:RecGamelistData = gameArray[indexPath.section] as! RecGamelistData
             headerView.Sectiontitle.text = collArray.title
             headerView.tag = indexPath.section+1;
             headerView.initBlock({(selectIndex) -> Void in
                
                print(selectIndex-1)
                
             })
            return headerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSizeMake(ScreenWidth, 30)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:RecommendCollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("ReCell", forIndexPath: indexPath) as! RecommendCollectionCell
         let collArray:RecGamelistData = gameArray[indexPath.section] as! RecGamelistData
        let Rdate:RecGamelistRoomlist = collArray.roomlist[indexPath.row] as! RecGamelistRoomlist
        cell.RecCollModel(Rdate)
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let PayDetails = PayDetailsViewController()
        self.presentViewController(PayDetails, animated: true, completion: nil)
//
    }
    
    
    //MARK: - 轮播图选中
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int) {
        
        print(index)
        
           let info:RecTopData = TopBase.data[index] as! RecTopData
        
         print(info)
    }
    
    

     //MARK: -  请求首页轮播图数据
    func LoadTopData(){
        
        let parameters:NSDictionary = ["aid":"ios","auth":"97d9e4d3e9dfab80321d11df5777a107","client_sys":"ios","time":GetNowTimes()]
        MKAPI.GET(TOP_URl, parameters:parameters, succeed: Topsuccess, failed: Topfailed)
        
    }
    
    func Topsuccess(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        TopBase = RecTopBaseClass(dictionary: responseObject as! [NSObject : AnyObject])
        for var i=0;i<TopBase.data.count; ++i{
            let info:RecTopData = TopBase.data[i] as! RecTopData
            imageArray.addObject(info.picUrl)
            titleArray.addObject(info.title)
        }
        if((titleArray) != nil&&(imageArray) != nil){
         
           self.myTopHeaderView.imageURLStringsGroup = imageArray as [AnyObject]
           self.myTopHeaderView.titlesGroup = titleArray as [AnyObject]
        }
        
    }
    func Topfailed(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        print("失败了")
    }
    
    
    //MARK: - 推荐栏目
    func LoadmainData(){
        let baseurl:String = NEW_URl+GetNowTimes()
        MKAPI.GET(baseurl, parameters:"", succeed: mainsuccess, failed: mainfailed)
    }
    
    func mainsuccess(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        RecBase  = RecommendBaseClass(dictionary: responseObject as! [NSObject : AnyObject])
        footArray = RecBase.data
       if((footArray) != nil)
       {
        let Fwidth:NSInteger = NSInteger (ScreenWidth/3)
        self.myfootScroll.contentSize.width = CGFloat((footArray.count+1) * 5)+CGFloat(footArray.count * Fwidth)
        self.myfootScroll.setchannelScroll(footArray)
        topView!.backgroundColor = UIColor.whiteColor()
    }
        
    }
    func mainfailed(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        print("失败了")
    }
   
  //MARK: -   游戏列表数据

    func loadGamelist(){
    
        let baseurl:String = CHANEL_URl+GetNowTimes()
        MKAPI.GET(baseurl, parameters:"", succeed: gamesuccess, failed: gamefailed)
    }
    
    func gamesuccess(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        RecGame  = RecGamelistBaseClass(dictionary:  responseObject as! [NSObject : AnyObject])
        gameArray = RecGame.data
        self.mycollview.reloadData()
        
    }
    func gamefailed(operation: AFHTTPRequestOperation!, responseObject: AnyObject!)->Void{
        print("失败了")
    }


    func mainrefresh(){
    
//        LoadTopData()
//        LoadmainData()
//        loadGamelist()
        
    }
    
    
}
