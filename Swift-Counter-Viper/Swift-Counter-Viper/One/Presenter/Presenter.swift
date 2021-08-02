//
//  Presenter.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import RxSwift
import ReactorKit

class Presenter: NSObject, PresenterProtocol {
    
    weak var view  : ViewProtocol?
    var interactor : InteractorProtocol?
    var route      : RouteProtocol?
    var disposeBag = DisposeBag()
    
    func presntenTwo() {
        route?.presntenTwo(fromVC: view as! UIViewController)
    }
}

extension Presenter :StoryboardView {
    typealias Reactor = Presenter
    
    func bind(reactor: Presenter.Reactor) {
        if let tap =  view?.getincreaseTap() {
            tap.map({_ in Reactor.Action.increase})
                .bind(to: reactor.action)
                .disposed(by: disposeBag)
        }
        
        //state
        guard let text = view?.getLabelText() else { return }
        reactor.state.map {
            $0.value
            }.map{ "\($0)"}
            .bind(to: text)
            .disposed(by: disposeBag)
    }
    func setReactor<T>(reactor: T) {
        self.reactor = reactor as? Presenter.Reactor
    }
}

// MARK: reactor
extension Presenter :Reactor {
    typealias State = Interactor.State
    
    var initialState: State {
        return Interactor.State(value: 0)
    }
    
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
    
    func mutate(action: Presenter.Action) -> Observable<Mutation> {
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
    
    func reduce(state: Presenter.State, mutation: Presenter.Mutation) -> Presenter.State {
        //改变数据
        var state = state
        if state.value > 10 {
            self.presntenTwo()
            return state
        }
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
