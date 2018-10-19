//
//  TwoReducer.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/19.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReSwift

func twoReducer(action: Action, state: AppState?) -> AppState {
    var stateM = state ?? AppState()
    switch action {
    case let twoAction as TwoLoadDataAction:
        switch twoAction.result {
        case let .success(list):
            stateM.sectionList = list
            break
        case .loading:
            print("loading......")
            break
        case .failure(_): break
        }
    default:
        break
    }
    return stateM
}
