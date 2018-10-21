//
//  DBUserModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/21.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class DBUserModel: NSObject {
    var userName: String!
    var userID  : Int!
    convenience init(name: String,userID: Int) {
        self.init()
        self.userName = name
        self.userID   = userID
    }
}
