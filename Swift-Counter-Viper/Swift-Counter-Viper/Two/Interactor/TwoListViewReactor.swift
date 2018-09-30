//
//  TwoListViewReactor.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/30.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import RxSwift
import ReactorKit

class TwoListViewReactor: NSObject,Reactor {
    var initialState: TwoEntity
    
    typealias State = TwoEntity
    
    enum Action {
        case loadData
        case nextPage
    }
    
    override init() {
        self.initialState = TwoEntity()
    }
}
