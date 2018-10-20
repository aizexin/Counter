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
    
    let loadSuccess = PublishSubject<TwoAction>()
    
    let dispose = DisposeBag()
//    enum TwoAction {
//        case callloaddata
//        case loadDataSuccess(list: [AISectionModel])
//    }
    struct TwoAction {
        let reuslt :APIRequest<[AISectionModel]>
    }
    
    override init() {
        self.initialState = [AISectionModel]()
        super.init()
        loadSuccess.bind(to: self.action).disposed(by: dispose)

        mainStore.subscribe(self)
    }

    func reduce(state: [AISectionModel], mutation: TwoPresenter.TwoAction) -> [AISectionModel] {
        var state = state
        
        switch mutation.reuslt {
        case .loading:
            AITwoRemoteSeverice.loadData()
            break
        case .success(let list):
            state = list
            break
        case .failure(_):
            break
        }
        return state
    }

    //想办法在newstate中调用Presnter的action
    func newState(state: AppState) {
        print("count ==\(state.sectionList.count)")
        if state.sectionList.count > 0 {
            loadSuccess.onNext(TwoAction(reuslt: .success(state.sectionList)))
        }
    }
    
}

