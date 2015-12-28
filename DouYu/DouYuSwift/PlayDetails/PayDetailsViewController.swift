//
//  PayDetailsViewController.swift
//  DouYuSwift
//
//  Created by maxin on 15/12/21.
//  Copyright © 2015年 maxin. All rights reserved.
//
/// 用于处理游戏播放的类

let videoUrl1 = NSURL(string: "http://112.65.220.28/flv2.bn.netease.com/videolib3/1512/25/PZMbw3680/SD/PZMbw3680-mobile.mp4")!
let videoUrl = "http://112.65.220.28/flv2.bn.netease.com/videolib3/1512/25/PZMbw3680/SD/PZMbw3680-mobile.mp4"
import UIKit
import AVFoundation
class PayDetailsViewController: BaseViewController ,PlayerDelegate,FMGVideoPlayViewDelegate{

      private var player: Player!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default;
        VideoPlay()
//        maintestView()
//        Mediaplayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.player.playFromBeginning()
    }
    
    
    func maintestView(){
    
        let testview:UIView = UIView(frame:CGRectMake(0, 20+ScreenWidth*9/16, ScreenWidth, ScreenWidth*9/16))
        testview.backgroundColor = UIColor.redColor()
        self.view.addSubview(testview)
    }
    
    
    func Mediaplayer(){
        
        self.view.autoresizingMask = ([UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight])
        
        self.player = Player()
        self.player.delegate = self
        self.player.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth*9/16)
        
        self.addChildViewController(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMoveToParentViewController(self)
        
        self.player.setUrl(videoUrl1)
        
        self.player.playbackLoops = true
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTapGestureRecognizer:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    

     
    func VideoPlay(){

       let playView:FMGVideoPlayView = (NSBundle.mainBundle().loadNibNamed("FMGVideoPlayView", owner: nil, options: nil)[0] as? FMGVideoPlayView)!
        playView.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth*9/16)
        playView.delegate = self
        playView.urlString = videoUrl
        self.view.addSubview(playView)
        playView.contrainerViewController = self
        
    }
    
    
    // MARK: UIGestureRecognizer
    
    func handleTapGestureRecognizer(gestureRecognizer: UITapGestureRecognizer) {
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.Stopped.rawValue:
            self.player.playFromBeginning()
        case PlaybackState.Paused.rawValue:
            self.player.playFromCurrentTime()
        case PlaybackState.Playing.rawValue:
            self.player.pause()
        case PlaybackState.Failed.rawValue:
            self.player.pause()
        default:
            self.player.pause()
        }
    }


    // MARK: PlayerDelegate
    
    func playerReady(player: Player) {
    }
    
    func playerPlaybackStateDidChange(player: Player) {
    }
    
    func playerBufferingStateDidChange(player: Player) {
    }
    
    func playerPlaybackWillStartFromBeginning(player: Player) {
    }
    
    func playerPlaybackDidEnd(player: Player) {
    }
    
    func backAction() {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func shareAction() {
        
    }


    
}
