//
//  ZXDSegmentBarViewController.swift
//  ZXDSegmentBar
//
//  Created by 张兴栋 on 2020/7/28.
//  Copyright © 2020 张兴栋. All rights reserved.
//
import UIKit

typealias YTSegmentBarVCBlock = (Int, Int) -> ()
weak var weakSelfs: ZXDSegmentBarViewController?

class ZXDSegmentBarViewController: UIViewController,UIScrollViewDelegate,ZXDSegmentBarDelegate {
    
    open var didSelectBlock:YTSegmentBarVCBlock?
    lazy internal var scrollView: UIScrollView? = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    func setUpWithItems(items: Array <String> , childVCs: Array <UIViewController>) {
        assert(items.count > 0 && items.count == childVCs.count , "个数不能为0，并且个数要一致，请自己检查")
        segmentBar?.items = items
        self.children.forEach { (viewController) in
            viewController.removeFromParent()
        }
        for vc in childVCs {
            addChild(vc)
        }
        scrollView?.contentSize = CGSize(width: items.count * Int(view.width), height: 0)
        segmentBar?.selectIndex = 0
    }
    
    func showChildVCViewAtIndex(index: Int) {
        if children.count == 0 || index < 0 || index > (children.count - 1) {
            return
        }
        let vc = children[index]
        vc.view.frame = CGRect(x: CGFloat(index) * kScreenWidth, y: 0, width: kScreenWidth, height: scrollView?.height ?? 0)
        scrollView?.addSubview(vc.view)
        //滑动到对应位置
        scrollView?.setContentOffset(CGPoint(x: CGFloat(index) * kScreenWidth, y: 0), animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if segmentBar?.superview === view {
            let contentViewY: CGFloat = (segmentBar?.y ?? 0) + (segmentBar?.height ?? 0)
            let contentFrame: CGRect = CGRect(x: 0, y: contentViewY, width: view.width, height: view.height - contentViewY)
            scrollView?.contentSize = CGSize(width: Int(CGFloat(children.count) * view.width), height: 0)
            scrollView?.frame = contentFrame
            return
        }
        let contentFrame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        scrollView?.contentSize = CGSize(width: Int(CGFloat(children.count) * view.width), height: 0)
        scrollView?.frame = contentFrame
        segmentBar?.selectIndex = segmentBar?.selectIndex ?? 0
    }
// MARK: ZXDSegmentBarDelegate
    func segmentBar(segmentBar: ZXDSegmentBar, toIndex: Int, fromIndex: Int) {
        if didSelectBlock != nil && toIndex != fromIndex {
            didSelectBlock?(toIndex , fromIndex)
        }
        showChildVCViewAtIndex(index: toIndex)
    }
// MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.width
        let index: Int = Int(scrollView.contentOffset.x / floor(width))
        segmentBar?.selectIndex = index
    }
    
    lazy public var segmentBar: ZXDSegmentBar? = {
       let segmentBar = ZXDSegmentBar(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 45))
        segmentBar.showIndicator = true
        segmentBar.selectIndex = 0
        segmentBar.delegate = self
        segmentBar.backgroundColor = .groupTableViewBackground
        view.addSubview(segmentBar)
        return segmentBar
    }()
}






