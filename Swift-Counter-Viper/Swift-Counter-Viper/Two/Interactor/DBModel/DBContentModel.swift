//
//  DBContentModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/21.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReSwift

class DBContentModel: NSObject,StateType {
    var contentID  : Int!
    var contentText: String!
    var userId     : Int!
    var cellIdList = [Int]()
    convenience init(id: Int, text: String ,userId: Int,cellIdList: [Int] = [Int]()) {
        self.init()
        self.contentID   = id
        self.contentText = text
        self.userId      = userId
        self.cellIdList  = cellIdList
    }
}
