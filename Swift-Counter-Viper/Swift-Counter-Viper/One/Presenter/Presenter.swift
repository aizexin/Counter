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

class Presenter: NSObject,PresenterProtocol,StoryboardView {
    
    weak var view  : ViewProtocol?
    var interactor : InteractorProtocol?
    var route      : RouteProtocol?
    
    var disposeBag = DisposeBag()
    
    typealias Reactor = Interactor
    
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
    
    func presntenTwo() {
        route?.presntenTwo(fromVC: view as! UIViewController)
    }
}
