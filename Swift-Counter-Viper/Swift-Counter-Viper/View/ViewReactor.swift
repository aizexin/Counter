//
//  ViewReactor.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReactorKit
import Then
import RxSwift

class ViewReactor: Reactor {
    var initialState: ViewReactor.State
    
    //这里属于view
    enum Action {
        case increase
        case decrease
    }
    
    //操作数据的 应该分在interactor
    enum Mutation {
        case increaseValue
        case decreaseValue
        
    }
    struct State {
        var value : Int
    }
    
    init() {
        self.initialState = State(value: 0)
    }
    
    func mutate(action: ViewReactor.Action) -> Observable<Mutation> {
        //action 分类
        switch action {
        case .increase:
            return Observable.concat([
                Observable.just(Mutation.increaseValue)
                ])
        case .decrease:
            return Observable.concat([
                Observable.just(Mutation.decreaseValue)
                ])
        }
    }
    
    func reduce(state: ViewReactor.State, mutation: ViewReactor.Mutation) -> ViewReactor.State {
        //改变数据
        var state = state
        switch mutation {
        case .increaseValue:
            state.value += 1
            break
        case .decreaseValue:
            state.value -= 1
            break
        }
        return state
    }
}
