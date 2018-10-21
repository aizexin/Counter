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
    typealias Item = AICellModel

    var items: [AICellModel] = []
    var userId     : Int
    var contentId  : Int
    var name     : String!
    var content  : String!
    
    init(name: String, content: String, cellList: [AICellModel],userID: Int,contentID: Int) {
        self.name     = name
        self.content  = content
        self.userId   = userID
        self.contentId = contentID
        items = cellList
    }
    
    
    init(original: AISectionModel, items: [AICellModel]) {
        self       = original
        self.items = items
    }
}
