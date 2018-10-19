//
//  SectionModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/30.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import RxDataSources

struct AISectionModel: SectionModelType {
    var items: [AICellModel] = []

    typealias Item = AICellModel
    
    var name     : String!
    var content  : String!
    
     init(name: String, content: String, cellList: [AICellModel]) {
        self.name     = name
        self.content  = content
        items = cellList
    }
    
    init(original: AISectionModel, items: [AICellModel]) {
        self       = original
        self.items = items
    }
}
