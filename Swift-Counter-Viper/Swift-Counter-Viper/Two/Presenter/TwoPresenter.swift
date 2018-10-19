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
    typealias State = [AISectionModel]
    
    let loadSuccess = PublishSubject<TwoAction>()
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
    }
    
    func reduce(state: [AISectionModel], mutation: TwoPresenter.TwoAction) -> [AISectionModel] {
        var state = state
        switch mutation {
        case .callloaddata:
            
            AITwoRemoteSeverice.loadData()
            break
        case .loadDataSuccess(let list):
            state = list
            break
        }
        return state
    }

}
