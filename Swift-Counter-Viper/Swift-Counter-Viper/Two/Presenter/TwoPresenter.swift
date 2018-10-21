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
    
    var initialState: [DBContentModel]
    typealias Action = TwoAction
    typealias Mutation = TwoMutation
    typealias State  = [DBContentModel]
    var interactor   : TwoInteractor!
    
    enum TwoAction {
        case callloaddata
        case loadDataSuccess(list: [DBContentModel])
    }
    
    enum TwoMutation {
        case loadDataSuccess(list: [DBContentModel])
    }

    override init() {
        self.initialState = [DBContentModel]()
        super.init()
    }
    
    func mutate(action: TwoPresenter.TwoAction) -> Observable<TwoPresenter.Mutation> {
        switch action {
        case .callloaddata:
            interactor.loadData()
            break
        case .loadDataSuccess(let list):
            return Observable.concat([Observable.just(TwoMutation.loadDataSuccess(list: list))])
        }
        return Observable.empty()
    }

    func reduce(state: [DBContentModel], mutation: TwoPresenter.Mutation) -> [DBContentModel] {
        var state = state
        switch mutation {
        case .loadDataSuccess(let list):
            //route 隐藏HUD
            state = list
            break
        }
        return state
    }
}

