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
            let cellModel1  = AICellModel(content: "1111")
            let cellModel2  = AICellModel(content: "2222")
            let cellModel3  = AICellModel(content: "3333")
            
            let listArray : [AISectionModel]   = [
                AISectionModel(name: "1", content: "xxxxxx", cellList: [cellModel1,cellModel1,cellModel1]),
                AISectionModel(name: "2", content: "xxxxxx", cellList: [cellModel2]),
                AISectionModel(name: "3", content: "xxxxxx", cellList: [cellModel3])
            ]
            mainStore.dispatch(TwoLoadDataAction(result: .success(listArray)))
        }
    }
}
