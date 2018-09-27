//
//  Route.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class Route: NSObject,RouteProtocol {
    func showVC() -> Void {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let view       = storyBoard.instantiateInitialViewController() as! ViewController
        let interactor = Interactor()
        let presenter  = Presenter()
        
        presenter.interactor = interactor
        presenter.view       = view
        view.presenter       = presenter
        interactor.presenter = presenter
        
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        window.backgroundColor    = UIColor.white
        window.rootViewController = view
        window.makeKeyAndVisible()
    }
}
