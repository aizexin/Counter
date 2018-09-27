//
//  AppDelegate.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let viewcontroller = self.window?.rootViewController as! ViewController
        viewcontroller.reactor = ViewReactor()
        
        return true
    }

}

