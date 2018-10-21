//
//  DBCellModel.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/21.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

class DBCellModel: NSObject {
    var id :Int!
    var content: String!
    convenience init(id: Int, content:String ) {
        self.init()
        self.id = id
        self.content = content
    }
}
