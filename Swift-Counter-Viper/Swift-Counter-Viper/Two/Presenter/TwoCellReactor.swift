//
//  TwoCellReactor.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/20.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

class TwoCellReactor: NSObject,Reactor {
    var initialState: AICellModel
    
    typealias Action = CellAction
    
    typealias State = AICellModel
    
    enum CellAction {
        case onClick(IndexPath)
        case noAction
    }
    
    override init() {
        self.initialState  = AICellModel()
        super.init()
    }
    convenience init(model: AICellModel) {
        self.init()
        self.initialState = model
    }
    
    func reduce(state: AICellModel, mutation: TwoCellReactor.CellAction) -> AICellModel {
//        var state = state
        switch mutation {
        case let .onClick(indexpath):
            state.content = "I AM CHANGE"
            mainStore.dispatch(OnClickCellAction(indexPath: indexpath,cellModel: state))
            break
        case .noAction:
            break
        }
        return state
    }
}
