//
//  TwoInteractor.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/30.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ReSwift

class TwoInteractor: NSObject ,StoreSubscriber{
    
    weak var presnter : TwoPresenter!
    let dispose = DisposeBag()
    
    override init() {
        super.init()
    }
    
    convenience init(presenter:TwoPresenter) {
        self.init()
        self.presnter = presenter

        mainStore.subscribe(self)
  
    }
    deinit {
        mainStore.unsubscribe(self)
    }
    //想办法在newstate中调用Presnter的action
    func newState(state: AppState) {
        print("count ==\(state.sectionList.count)")
       presnter.action.onNext(.loadDataSuccess(list: state.sectionList))
//        if state.sectionList.count > 0 {
//            loadSuccess.onNext(.loadDataSuccess(list: state.sectionList))
//        }
    }
    
    func loadData() {
        AITwoRemoteSeverice.loadData()
    }
}
