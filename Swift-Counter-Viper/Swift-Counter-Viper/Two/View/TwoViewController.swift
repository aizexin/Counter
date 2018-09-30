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

typealias ListModel = SectionModel<AISectionModel,AICellModel>
class TwoViewController: UIViewController ,View{
    
    var disposeBag = DisposeBag()

    typealias Reactor = TwoListViewReactor

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
        
        tableView = UITableView.init(frame: view.bounds, style: .grouped)
        tableView.register(AITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        disMissButton = UIButton(type: .custom).then({ (btn) in
            btn.setTitle("dismiss", for: .normal)
            btn.backgroundColor = UIColor.orange
            btn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
            btn.rx.tap.asControlEvent().bind(onNext: {
                self.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
        })
        view.addSubview(disMissButton)
        
        
        
        let cellModel1  = AICellModel(content: "1111")
        let cellModel2  = AICellModel(content: "2222")
        let cellModel3  = AICellModel(content: "3333")
        
        let listArray : [AISectionModel]   = [
            AISectionModel(name: "1", content: "xxxxxx", cellList: [cellModel1]),
            AISectionModel(name: "2", content: "xxxxxx", cellList: [cellModel2]),
            AISectionModel(name: "3", content: "xxxxxx", cellList: [cellModel3])
            ]
        
        Observable.just(listArray).bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
    }
    
    func bind(reactor: TwoListViewReactor) {
//        reactor.state.bind(to: tableView.rx.items(dataSource: self.dataSource))
    }
}
