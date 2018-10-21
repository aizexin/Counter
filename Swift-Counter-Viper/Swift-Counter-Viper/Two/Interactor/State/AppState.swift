//
//  AppState.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/19.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReSwift
struct AppState: StateType {
    var flatenList   = [DBContentModel]()
    var userState    : UserState = UserState()
    var contentState : ContentState = ContentState()
    var cellCommentState : CellCommentState = CellCommentState()
}
