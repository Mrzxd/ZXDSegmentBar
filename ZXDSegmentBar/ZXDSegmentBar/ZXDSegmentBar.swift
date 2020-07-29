//
//  ZXDSegmentBar.swift
//  ZXDSegmentBar
//
//  Created by 张兴栋 on 2020/7/27.
//  Copyright © 2020 张兴栋. All rights reserved.
//

import UIKit
import Foundation

weak var weakSelf: ZXDSegmentBar?

protocol ZXDSegmentBarDelegate : NSObjectProtocol {
    func segmentBar(segmentBar: ZXDSegmentBar, toIndex: Int, fromIndex: Int)
}

class ZXDSegmentBar:UIView {
   
   weak open var delegate:ZXDSegmentBarDelegate?
   open var showIndicator:Bool?
   private var _items: Array <String>?
   open var items: Array <String>? {
        set {
            _items = newValue
            itemBtns.forEach { (button) in
                button.removeFromSuperview()
             }
            itemBtns.removeAll()
            if newValue != nil {
                var i = 0
                for item in newValue! {
                    let btn = UIButton()
                    btn.tag = itemBtns.count
                    btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchDown)
                    btn.setTitleColor(config.itemNormalC, for: .normal)
                    btn.setTitleColor(config.itemSelectC, for: .selected)
                    if i == 0 {
                        btn.isSelected = true
                        _lastBtn = btn
                    }
                    btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: i > 0 ? 14 : 16)
                    btn.setTitle(item, for: .normal)
                    contentView.addSubview(btn)
                    itemBtns.append(btn)
                    i = 1
                }
                self.setNeedsLayout()
                self.layoutIfNeeded()
            }
        } get {
            return _items
        }
    }
    open var selectIndex: Int {
        set {
            if (items?.count == 0) || (newValue < 0) || (newValue > itemBtns.count - 1) {
                _selectIndex = 0
                return;
            }
            _selectIndex = newValue
            let btn  = itemBtns[newValue]
            btnClick(sender: btn)
        } get {
            return _selectIndex ?? 0
        }
    }
   open var space: Float?
   internal var _selectIndex: Int?
   internal var _lastBtn: UIButton!
   lazy internal var contentView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
        return scrollView
    }()
    lazy internal var itemBtns: Array <UIButton> = {
        let array = Array<UIButton>()
        return array
    }()
    lazy internal var indicatorView: UIView = {
        let indicatorH = config.indicatorH
        let indicatorView = UIView(frame: CGRect(x: 0, y: self.height - (indicatorH ?? 0) , width: 0, height: (indicatorH ?? 0)))
        indicatorView.backgroundColor = config.indicatorC
        contentView.addSubview(indicatorView)
        return indicatorView
    }()
   internal var config: ZXDSegmentBarConfig {
        get {
            return ZXDSegmentBarConfig.segmentBarConfig//返回单例
        }
    }
    
    open class func segmentBarWithFrame(frame: CGRect) -> Any {
        let segmentBar = ZXDSegmentBar(frame: frame)
        return segmentBar
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        weakSelf = self
        backgroundColor = config.segmentBarBackGroundC
        space = 12
    }
    
    public func updateWithConfig(configBlock: ((ZXDSegmentBarConfig) -> ())?) {
        if configBlock != nil {
            configBlock!(config)
        }
        backgroundColor = config.segmentBarBackGroundC
        if showIndicator != nil {
            indicatorView.backgroundColor = config.indicatorC
        }
        var i = 0
        for btn in itemBtns {
            btn.setTitleColor(config.itemNormalC, for: .normal)
            btn.setTitleColor(config.itemSelectC, for: .selected)
            i += 1
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    @objc func btnClick(sender: UIButton) {
        
        if delegate != nil && ((delegate?.responds(to: Selector(("segmentBar:")))) != nil) {
            delegate?.segmentBar(segmentBar: self, toIndex: sender.tag, fromIndex: _lastBtn.tag)
        }
        _lastBtn.isSelected = false
        _lastBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        _selectIndex = sender.tag
        sender.isSelected = true
        _lastBtn = sender
        
        if showIndicator != nil {
            UIView.animate(withDuration: 0.1) {
                weakSelf?.indicatorView.width = CGFloat(sender.currentTitle!.count) / 2.0 * 25//sender.width + self.config.indicatorW * 2
                weakSelf?.indicatorView.centerX = sender.centerX
            }
        }
        // 滚动到Btn的位置
        var scrollX = sender.x - contentView.width * 0.5
        // 考虑临界的位置
        if scrollX < 0 {
            scrollX = 0
        }
        if scrollX > (contentView.contentSize.width - contentView.width) {
            scrollX = contentView.contentSize.width - contentView.width
        }
        contentView.setContentOffset(CGPoint(x: scrollX, y: 0), animated: true)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = self.bounds
        
        var totalBtnWidth :CGFloat = 0
        for btn in itemBtns {
            btn.sizeToFit()
            totalBtnWidth += btn.width
        }
        var caculateMargin :CGFloat = 0
        var spaceX: CGFloat = 0
        for btn in itemBtns {
            var frame = btn.frame
            caculateMargin = CGFloat(btn.currentTitle?.count ?? 0) * (config.itemHeight ?? 0)
            if caculateMargin < (kScreenWidth / CGFloat(itemBtns.count)) {
               caculateMargin = kScreenWidth / CGFloat(itemBtns.count)
            }
            frame.size.width = caculateMargin
            btn.frame = frame
            btn.y = (self.height - btn.height) / 2
            btn.x = spaceX
            spaceX += caculateMargin
        }
        
        self.contentView.contentSize = CGSize(width: spaceX, height: 0)
        if itemBtns.count == 0 {
            return
        }
        
        let btn = itemBtns[selectIndex]
        indicatorView.width = CGFloat(btn.currentTitle?.count ?? 0) * 25 / 2.0
        indicatorView.centerX = btn.centerX
        indicatorView.height = config.indicatorH ?? 0
        indicatorView.y = self.height - indicatorView.height
        indicatorView.clipsToBounds = true
        indicatorView.layer.cornerRadius = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
