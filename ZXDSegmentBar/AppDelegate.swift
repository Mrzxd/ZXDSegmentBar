//
//  AppDelegate.swift
//  ZXDSegmentBar
//
//  Created by  张兴栋 on 2020/7/27.
//  Copyright © 2020 张兴栋. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = ViewController();
        self.window?.makeKeyAndVisible()
        return true
    }

}

