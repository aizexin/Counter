//
//  UserState.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/21.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReSwift

class UserState: NSObject {
    var userList : [Int:DBUserModel] = [:]
}

extension UserState :StateType {
    
}
