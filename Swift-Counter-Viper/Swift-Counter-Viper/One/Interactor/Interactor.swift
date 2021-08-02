//
//  Interactor.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReactorKit
import Then
import RxSwift

class Interactor: NSObject,InteractorProtocol {
    
    var presenter: PresenterProtocol?
    
    struct State {
        var value : Int
    }
    
    override init() {
    }

}
