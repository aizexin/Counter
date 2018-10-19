//
//  Route.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class Route: NSObject,RouteProtocol {
    func presntenTwo(fromVC: UIViewController) {
        let twoVC = TwoViewController()
//        let presenter = TwoPresenter()
//        twoVC.reactor = presenter
        fromVC.present(twoVC, animated: true, completion: nil)
    }
    
}
