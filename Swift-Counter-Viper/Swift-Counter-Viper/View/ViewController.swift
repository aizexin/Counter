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

class ViewController: UIViewController,StoryboardView {
    var disposeBag = DisposeBag()
    
    typealias Reactor = ViewReactor

    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        DISPATCH_ONCE_INLINE_FASTPATH
//        self.reactor = ViewReactor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func bind(reactor: ViewController.Reactor) {
        increaseButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        decreaseButton.rx.tap
            .map { Reactor.Action.decrease}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //State -->bind  View
        reactor.state.map {
            $0.value
        }.map{ "\($0)"}
        .bind(to: label.rx.text)
        .disposed(by: disposeBag)
    }
}

