//
//  AITwoRemoteSeverice.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/19.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class AITwoRemoteSeverice: NSObject {
    class func loadData() {
        mainStore.dispatch(TwoLoadDataAction(result: .loading))
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let cellModel1  = OriginalCommentModel(id: 1, content: "xxxxx1")
            let cellModel2  = OriginalCommentModel(id: 2, content: "xxxxx2")
            let cellModel3  = OriginalCommentModel(id: 3, content: "xxxxx3")
            
            let listArray : [OriginalSectionModel]   = [
                
                OriginalSectionModel(name: "section1", content: "aaaaa", cellList: [cellModel1], userID: 1, contentID: 1),
                OriginalSectionModel(name: "section2", content: "bbbbb", cellList: [cellModel2], userID: 2, contentID: 2),
                OriginalSectionModel(name: "section3", content: "ccccc", cellList: [cellModel3], userID: 3, contentID: 3)
            ]
            mainStore.dispatch(TwoLoadDataAction(result: .success(listArray)))
        }
    }
}
