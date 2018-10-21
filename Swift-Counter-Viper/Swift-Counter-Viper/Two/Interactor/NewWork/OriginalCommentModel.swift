//
//  OriginalCellModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/21.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class OriginalCommentModel: NSObject {
    var commentID:Int!
    var commentContent:String!
    convenience init(id: Int,content:String) {
        self.init()
        self.commentID = id
        self.commentContent = content
    }
}
