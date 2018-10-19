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

class TwoPresenter: NSObject,TwoPresenterProtocol,Reactor,StoreSubscriber {
    
    var initialState: [AISectionModel]
    typealias Action = TwoAction
    typealias State = [AISectionModel]
    
    enum TwoAction {
        case callloaddata
        case loadDataSuccess(list: [AISectionModel])
    }
    
    override init() {
        self.initialState = [AISectionModel]()
        super.init()
    }
    
    convenience init(state: [AISectionModel]) {
        self.init()
        self.initialState = state
        mainStore.subscribe(self)
    }
    
    deinit {
        mainStore.unsubscribe(self)
    }
    
    func reduce(state: [AISectionModel], mutation: TwoPresenter.TwoAction) -> [AISectionModel] {
        switch mutation {
        case .callloaddata:
            AITwoRemoteSeverice.loadData()
            break
        case .loadDataSuccess:
            break
        }
        return state
    }
    
    func newState(state: AppState) {
        let loadSuccess = PublishSubject<TwoAction>()
        loadSuccess.onNext(.loadDataSuccess(list: state.sectionList))
    }

}
