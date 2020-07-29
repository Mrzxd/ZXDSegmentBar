//
//  UIView+ZXDSegmentBar.swift
//  ZXDSegmentBar
//
//  Created by 张兴栋 on 2020/7/27.
//  Copyright © 2020 张兴栋. All rights reserved.
//
import UIKit
import Foundation

extension UIView {
//    convenience init(frames:CGRect) {
//        // 便利构造方法必须依赖于指定构造方法!
//        self.init(frame:frames)
//    }
   open var x:CGFloat {
        set {
            self.frame.origin.x = newValue
        }
        get {
            return self.frame.origin.x
        }
    }
   open var y:CGFloat {
        set {
            self.frame.origin.y = newValue
        }
        get {
            return self.frame.origin.y
        }
    }
   open var width:CGFloat {
        set {
            self.frame.size.width = newValue
        }
        get {
            return self.frame.size.width
        }
    }
   open var height:CGFloat {
        set {
            self.frame.size.height = newValue
        }
        get {
            return self.frame.size.height
        }
    }
   open var centerX:CGFloat {
        set {
            self.center.x = newValue
            }
        get {
            return self.center.x
        }
    }
   open var centerY:CGFloat {
        set {
            self.center.y = newValue
        }
        get {
            return self.center.y
        }
    }
}
