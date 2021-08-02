//
//  TwoViewController.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/30.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ReactorKit

class TwoViewController: UIViewController ,View {
    
    typealias Reactor = TwoPresenter
    var disposeBag    = DisposeBag()
    var disMissButton: UIButton!
    var tableView    : UITableView!
    var presenter    : TwoPresenter!
//    let dataSource = RxTableViewSectionedReloadDataSource<DBContentModel> (configureCell: { (_, tableView, indexpath, commentId) -> UITableViewCell in
//        guard let cell = tableView.dequeueReusableCell(withIdentifier:"cell") as? AITableViewCell else {
//            print("======")
//            return AITableViewCell()
//        }
//        cell.indexPath = indexpath
//        let reactor = TwoCellReactor(commentId: commentId)
//        cell.reactor = reactor
//        return cell
//    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.register(AITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        disMissButton = UIButton(type: .custom).then({ (btn) in
            btn.setTitle("dismiss", for: .normal)
            btn.backgroundColor = UIColor.orange
            btn.frame = CGRect.init(x: 0, y: 100, width: 50, height: 50)
        })
        view.addSubview(disMissButton)
        
        presenter        = TwoPresenter()
        let interactor   = TwoInteractor(presenter: presenter)
        presenter.interactor = interactor
        
        self.reactor = self.presenter
    }
    
    deinit {
        print("=TWOVC--deinit===========")
    }
    
    func bind(reactor: TwoPresenter) {
        
        disMissButton.rx.tap
            .asControlEvent()
            .bind(onNext: {
                print("dissmiss")
                self.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
        
//        self.rx.viewWillAppear
//            .map { (_) -> TwoPresenter.Action in
//                return .callloaddata
//            }.bind(to: reactor.action)
//            .disposed(by: disposeBag)
        //state-->View
//        reactor.state
//            .bind(to: tableView.rx.items(dataSource: self.dataSource))
//            .disposed(by: disposeBag)
    }
}
