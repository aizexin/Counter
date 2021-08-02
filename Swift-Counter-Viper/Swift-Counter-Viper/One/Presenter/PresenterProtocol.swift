//
//  PresenterProtocol.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReactorKit
protocol PresenterProtocol: AnyObject {
    func setReactor<T>(reactor :T)
    func presntenTwo() -> Void
}
