//
//  TwoReducer.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/19.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReSwift

func twoReducer(action: Action, state: AppState?) -> AppState {
    var stateM = state ?? AppState()
    switch action {
    case let twoAction as TwoLoadDataAction:
        switch twoAction.result {
        case let .success(list):
            //TODO:拆分数据，扁平
            stateM = flatenSectionList(list: list, state: stateM)
            break
        case .loading:
            print("loading......")
            break
        case .failure(_): break
        }
    case let onClickCell as OnClickCellAction:
        stateM.cellCommentState.commentDict[onClickCell.dbCommentid]?.content = "i am change"
        
//        var section = stateM.sectionList[action.indexPath.section]
//        section.items[action.indexPath.row] = action.cellModel
        break
    default:
        break
    }
    return stateM
}
///把数据压扁
func flatenSectionList(list: [OriginalSectionModel], state:AppState) -> AppState {
    var state = state
    var flatenList = [DBContentModel]()
    for sectionModel in list {
        let contentModel = DBContentModel(id: sectionModel.contentId, text: sectionModel.content, userId: sectionModel.userId)
        //存入内容字典
//        var contentList  = state.contentState.contentList
        state.contentState.contentList[contentModel.contentID] = contentModel
        //存入user字典
        let userModel = DBUserModel(name: sectionModel.name, userID: sectionModel.userId)
        state.userState.userList[userModel.userID] = userModel
        //cell回复字典
        var flatenCellList = [Int]()
        for commentModel in sectionModel.items {
            flatenCellList.append(commentModel.commentID)
            let dbcellModel = DBCellModel(id: commentModel.commentID, content: commentModel.commentContent)
            state.cellCommentState.commentDict[dbcellModel.id] = dbcellModel
        }
        contentModel.cellIdList = flatenCellList
        //cont
        flatenList.append(contentModel)
    }
    state.flatenList = flatenList
    return state
}
