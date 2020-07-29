//
//  ZXDSegmentBarConfig.swift
//  ZXDSegmentBar
//
//  Created by 张兴栋 on 2020/7/27.
//  Copyright © 2020 张兴栋. All rights reserved.
//

import UIKit

typealias ColorBlock = (UIColor) -> (ZXDSegmentBarConfig)
class ZXDSegmentBarConfig: NSObject {
/**
单例
*/
    static let segmentBarConfig:ZXDSegmentBarConfig = {
        let instance = ZXDSegmentBarConfig()
        instance.segmentBarBackGroundC = UIColor.clear
        instance.itemF = UIFont.systemFont(ofSize: instance.itemHeight ?? 0)
        instance.itemNormalC = UIColor(rgb:0x151515)
        instance.itemSelectC = UIColor(rgb:0xD0343F)
        instance.indicatorC = UIColor(rgb:0xD0343F)
        instance.indicatorH = 4
        instance.indicatorW = 10
        instance.itemHeight = 16
        return instance
    }()
    
    public var colorBlock:ColorBlock?
    // SegmentBar背景颜色
    var segmentBarBackGroundC:UIColor?
    // 默认颜色
    var itemNormalC:UIColor?
    // 选中颜色
    var itemSelectC:UIColor?
    // 标签字号
    var itemF:UIFont?
    // 指示器颜色
    var indicatorC:UIColor?
    // 指示器高
    var indicatorH:CGFloat?
    // 指示器宽
    var indicatorW:CGFloat?
    // 字体宽高
    var itemHeight:CGFloat?
    /**
    背景颜色
    */
    var segmentBarBackGroundColor:((UIColor) -> (ZXDSegmentBarConfig)) {
        get {
            colorBlock = { (color:UIColor) -> (ZXDSegmentBarConfig) in
                self.segmentBarBackGroundC = color
                return self
            }
            return colorBlock!
        }
    }
    /**
    默认颜色
    */
    var itemNormalColor:(UIColor) -> (ZXDSegmentBarConfig) {
        get {
            return { (color:UIColor) -> (ZXDSegmentBarConfig) in
                self.itemNormalC = color
                return self
            }
        }
    }
    /**
    选中颜色
    */
    var itemSelectColor:(UIColor) -> (ZXDSegmentBarConfig) {
        get {
            return {(color:UIColor) -> (ZXDSegmentBarConfig) in
                self.itemSelectC = color
                return self
            }
        }
    }
     /**
     文字字体大小
     */
    var itemFont:(UIFont) -> (ZXDSegmentBarConfig) {
        return {(font:UIFont) ->(ZXDSegmentBarConfig) in
            self.itemF = font
            return self
        }
    }
    /**
    指示器颜色
    */
    var indicatorColor:(UIColor) -> ZXDSegmentBarConfig {
        get {
            return {(color:UIColor) -> (ZXDSegmentBarConfig) in
                self.indicatorC = color
                return self
            }
        }
    }
    /**
    指示器高度
    */
    var indicatorHeight:(CGFloat) -> (ZXDSegmentBarConfig) {
        get {
            return {(indicatorH:CGFloat) -> (ZXDSegmentBarConfig) in
                self.indicatorH = indicatorH
                return self
            }
        }
    }
    /**
    指示器宽度
    */
    var indicatorWidth:(CGFloat) -> (ZXDSegmentBarConfig) {
        get {
            return {(indicatorWidth:CGFloat) -> (ZXDSegmentBarConfig) in
                self.indicatorW = indicatorWidth
                return self
            }
        }
    }
}
