//
//  ViewController.swift
//  ZXDSegmentBar
//
//  Created by 张兴栋 on 2020/7/27.
//  Copyright © 2020 张兴栋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {//ZXDSegmentBarDelegate这里把代理注释掉了,使用的时候要放到左边哦
    
//    lazy internal var segmentBar:ZXDSegmentBar = {
//        let segmentBar = ZXDSegmentBar(frame: AutoFrame(x: 0, y: 44, width: 375, height: 47))
//        segmentBar.showIndicator = true
//        segmentBar.selectIndex = 0
//        segmentBar.delegate = self
//        segmentBar.backgroundColor = .white
//        segmentBar.items = ["阿里.阿里","腾讯.腾讯","百度.腾讯","苹果.苹果","谷歌.谷歌","网易云.网易云","京东云.京东云","七牛云.七牛云"]
//        segmentBar.updateWithConfig { (config) in
//            config.itemNormalColor(.lightGray)
//                  .itemSelectColor(.black)
//                  .indicatorColor(.black)
//        }
//        return segmentBar
//    }()
//    func segmentBar(segmentBar: ZXDSegmentBar, toIndex: Int, fromIndex: Int) {
//
//    }
   
    lazy internal var segmentViewController:ZXDSegmentBarViewController = {
        let segmentViewController = ZXDSegmentBarViewController()
        segmentViewController.didSelectBlock = { (toIndex: Int, fromIndex: Int) in //这里返回 选择后的 index位置
        
        }
        segmentViewController.view.frame = CGRect(x: 0, y: KStatusBarHeight, width: kScreenWidth, height: self.view.height - KStatusBarHeight)
        self.addChild(segmentViewController)
        return segmentViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        
        let items = ["阿里.阿里","腾讯.腾讯","百度.腾讯","苹果.苹果","谷歌.谷歌","网易云.网易云","京东云.京东云","七牛云.七牛云"]
        var controllerArray = Array <UIViewController> ()
        for _ in 0..<items.count {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .randomColor
            controllerArray.append(viewController)
        }
        view.addSubview(segmentViewController.view)
        self.segmentViewController.setUpWithItems(items: items, childVCs: controllerArray)
//        self.segmentViewController.segmentBar?.selectIndex = 0
    }
}

