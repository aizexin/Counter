//
//  DBContentModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/21.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReSwift
import RxDataSources

class DBContentModel: NSObject,StateType,SectionModelType {
    required convenience init(original: DBContentModel, items: [Int]) {
        self.init()
        self.items = items
    }
    override init() {
        
    }
    
    var contentID  : Int!
    var contentText: String!
    var userId     : Int!
    var items = [Int]()
    convenience init(id: Int, text: String ,userId: Int,cellIdList: [Int] = [Int]()) {
        self.init()
        self.contentID   = id
        self.contentText = text
        self.userId      = userId
        self.items  = cellIdList
    }
}
