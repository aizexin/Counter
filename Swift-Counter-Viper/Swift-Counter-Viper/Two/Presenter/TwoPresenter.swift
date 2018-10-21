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
    typealias Mutation = TwoMutation
    typealias State  = [AISectionModel]
    var interactor   : TwoInteractor!
    
    enum TwoAction {
        case callloaddata
        case loadDataSuccess(list: [AISectionModel])
    }
    
    enum TwoMutation {
        case loadDataSuccess(list: [AISectionModel])
    }

    override init() {
        self.initialState = [AISectionModel]()
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

    func reduce(state: [AISectionModel], mutation: TwoPresenter.Mutation) -> [AISectionModel] {
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

