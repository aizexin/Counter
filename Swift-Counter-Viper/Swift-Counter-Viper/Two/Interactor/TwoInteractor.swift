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
        //TODO:根据展示列表重新组装一次Viewmodel（展示数据）的list
       let sectionList = self.buildUpViewModel(state: state)
       presnter.action.onNext(.loadDataSuccess(list: sectionList))

    }
    
    func loadData() {
        AITwoRemoteSeverice.loadData()
    }
    //把扁平化的数据重新组装起来
    func buildUpViewModel(state: AppState) -> [AISectionModel] {
        var sectionList = [AISectionModel]()
        for flaten in state.flatenList {
            //首先要获得数据库里面的dbmodel，然后通过dbmodel 转为展现的ViewModel
            if let userModel : DBUserModel = state.userState.userList[flaten.userId],
                let contentModel : DBContentModel = state.contentState.contentList[flaten.contentID] {
                var cellModelList = [AICellModel]()
                for id in flaten.cellIdList {
                    if let dbcellModel = state.cellCommentState.commentDict[id] {
                        let model = AICellModel(content: dbcellModel.content, userName: userModel.userName, userID: userModel.userID)
                        cellModelList.append(model)
                    }
                }
                let sectionModel = AISectionModel(name: userModel.userName, content: contentModel.contentText, cellList: cellModelList, userID: userModel.userID, contentID: contentModel.contentID)
                sectionList.append(sectionModel)
            }
        }
        return sectionList
    }
}
