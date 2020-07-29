//
//  Swift_M_H.swift
//
//  Created by 张兴栋 on 2019/11/15.
//  Copyright © 2019 张兴栋. All rights reserved.
//

import UIKit

var rootUrl = ""

let kScreenHeight = (CGFloat)(UIScreen.main.bounds.size.height)
let kScreenWidth = (CGFloat)(UIScreen.main.bounds.size.width)
let ScalePpth = (CGFloat)((kScreenWidth / 375.0))
let statusHeight = (CGFloat)(UIApplication.shared.statusBarFrame.size.height)

let isPad = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
let kiPhone4 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 960).equalTo((UIScreen.main.currentMode?.size)!)  && !isPad  : false
let kiPhone5 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) && !isPad : false
let kiPhone6 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) && !isPad : false
let kiPhone6Plus = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) && !isPad : false
let IS_IPHONE_X = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) && !isPad : false
let IS_IPHONE_Xr = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) && !isPad : false
let IS_IPHONE_Xs = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) && !isPad : false
let IS_IPHONE_Xs_Max = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) && !isPad : false

let KStatusBarHeight = (CGFloat)((IS_IPHONE_X == true || IS_IPHONE_Xr == true || IS_IPHONE_Xs == true || IS_IPHONE_Xs_Max == true) ? 44.0 : 20.0)
let KNavigationHeight = (CGFloat)((IS_IPHONE_X == true || IS_IPHONE_Xr == true || IS_IPHONE_Xs == true || IS_IPHONE_Xs_Max == true) ? 88.0 : 64.0)
let KTabBarHeight = (CGFloat)((IS_IPHONE_X == true || IS_IPHONE_Xr == true || IS_IPHONE_Xs == true || IS_IPHONE_Xs_Max == true) ? 83.0 : 49.0)
let KSafetyZoneHeight = (CGFloat)((IS_IPHONE_X == true || IS_IPHONE_Xr == true || IS_IPHONE_Xs == true || IS_IPHONE_Xs_Max == true) ? 34 : 0)

public func AutoFrame(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> CGRect {
    return CGRect(x: (x)*ScalePpth, y: (y)*ScalePpth, width: (width)*ScalePpth, height: (height)*ScalePpth)
}
public func XDATFrame(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> CGRect {
    return CGRect(x: (x)*ScalePpth, y: (y)*ScalePpth, width: (width)*ScalePpth, height: (height)*ScalePpth)
}
public func PPth(x:CGFloat) -> CGFloat {
    return (x) * ScalePpth
}
public func FontSize(height:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: CGFloat((height) * ScalePpth))
}

extension UIColor {
   public convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    public convenience init(rgbs: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgbs & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbs & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbs & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    //返回随机颜色
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random() % 256) / 255.0
            let green = CGFloat(arc4random() % 256) / 255.0
            let blue = CGFloat(arc4random() % 256) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
