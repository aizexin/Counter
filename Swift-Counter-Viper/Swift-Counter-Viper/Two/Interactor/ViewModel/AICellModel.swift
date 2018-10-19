//
//  CellModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/30.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class AICellModel: NSObject {
    var content: String!
    var userName: String!
    var userID  : Int!
    convenience init(content: String,userName: String = "", userID :Int = 0) {
        self.init()
        self.content = content
        self.userName = userName
        self.userID  = userID
    }
}
