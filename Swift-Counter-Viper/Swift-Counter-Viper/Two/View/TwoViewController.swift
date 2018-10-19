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
import RxDataSources
import RxViewController
import ReSwift
typealias ListModel = SectionModel<AISectionModel,AICellModel>
class TwoViewController: UIViewController ,View,StoreSubscriber {
    
    var disposeBag = DisposeBag()

    typealias Reactor = TwoPresenter

    var disMissButton: UIButton!
    var tableView    : UITableView!
    
    var sections   = PublishSubject<[AISectionModel]>()
    
    let dataSource = RxTableViewSectionedReloadDataSource<AISectionModel> (configureCell: { (_, tableView, indexpath, cellModel) -> UITableViewCell in
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"cell") else {
            print("======")
            return AITableViewCell()
        }
        cell.textLabel?.text = cellModel.content
        return cell
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStore.subscribe(self)
        
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.register(AITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        disMissButton = UIButton(type: .custom).then({ (btn) in
            btn.setTitle("dismiss", for: .normal)
            btn.backgroundColor = UIColor.orange
            btn.frame = CGRect.init(x: 0, y: 100, width: 50, height: 50)
        })
        view.addSubview(disMissButton)
        
        self.reactor = TwoPresenter()
    }
    
    func bind(reactor: TwoPresenter) {
        
        disMissButton.rx.tap.asControlEvent().bind(onNext: {
            print("dissmiss")
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        self.rx.viewWillAppear.map { (_) -> TwoPresenter.Action in
            return .callloaddata
        }.bind(to: reactor.action)
        .disposed(by: disposeBag)
        //state-->View
        reactor.state.bind(to: tableView.rx.items(dataSource: self.dataSource))
        .disposed(by: disposeBag)
    }
    
    func newState(state: AppState) {
        print("count ==\(state.sectionList.count)")
    }
}
