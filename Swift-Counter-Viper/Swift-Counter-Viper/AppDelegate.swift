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

        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let view       = storyBoard.instantiateInitialViewController() as! ViewController
        let presenter  = Presenter()
        let interactor = Interactor()
        
        presenter.route      = Route()
        presenter.interactor = interactor
        presenter.view       = view
        view.presenter       = presenter
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor    = UIColor.white
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        return true
    }

}

