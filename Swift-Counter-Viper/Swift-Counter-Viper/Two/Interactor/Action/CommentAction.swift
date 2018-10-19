//
//  CommentAction.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/10/19.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit

enum APIRequest<T> {
    case loading
    case success(T)
    case failure(Error)
}
