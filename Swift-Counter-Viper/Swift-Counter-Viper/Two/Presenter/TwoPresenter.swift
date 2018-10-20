//
//  TwoPresenter.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/30.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift
import ReSwift

class TwoPresenter: NSObject,TwoPresenterProtocol,Reactor {
    
    var initialState: [AISectionModel]
    typealias Action = TwoAction
    typealias State  = [AISectionModel]
    var interactor   : TwoInteractor!
        
    enum TwoAction {
        case callloaddata
        case loadDataSuccess(list: [AISectionModel])
    }

    override init() {
        self.initialState = [AISectionModel]()
        super.init()
    }

    func reduce(state: [AISectionModel], mutation: TwoPresenter.TwoAction) -> [AISectionModel] {
        var state = state
        switch mutation {
        case .callloaddata:
            //这里用route添加HUD
            interactor.loadData()
        case .loadDataSuccess(let list):
            //route 隐藏HUD
            state = list
            break
        }
        return state
    }
}

