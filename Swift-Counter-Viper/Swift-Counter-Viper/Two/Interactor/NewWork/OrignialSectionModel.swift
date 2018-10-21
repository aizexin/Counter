//
//  OrignialModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/21.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class OriginalSectionModel: NSObject {
    var items: [OriginalCommentModel] = []
    var userId     : Int
    var contentId  : Int
    var name     : String!
    var content  : String!
    
    init(name: String, content: String, cellList: [OriginalCommentModel],userID: Int,contentID: Int) {
        self.name     = name
        self.content  = content
        self.userId   = userID
        self.contentId = contentID
        items = cellList
    }
}
