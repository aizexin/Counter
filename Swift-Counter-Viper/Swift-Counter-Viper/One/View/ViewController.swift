//
//  ViewController.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/27.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

class ViewController: UIViewController,ViewProtocol {

    var presenter : PresenterProtocol?
    
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton?
    @IBOutlet weak var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let  interactor = Interactor()
        interactor.presenter = presenter
        
        presenter?.setReactor(reactor: interactor)
    }
    
    //viewprotocol
    func getincreaseTap() -> ControlEvent<Void>?  {
        return increaseButton?.rx.tap
    }
    func getLabelText() -> Binder<String?>? {
        return label?.rx.text
    }
}

