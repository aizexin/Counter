//
//  AITableViewCell.swift
//  Swift-Counter-Viper
//
//  Created by 艾泽鑫 on 2018/9/30.
//  Copyright © 2018 艾泽鑫. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ReactorKit

class AITableViewCell: UITableViewCell,View {
    
    var disposeBag = DisposeBag()
    typealias Reactor = TwoCellReactor
    var button : UIButton!
    var indexPath : IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        button = UIButton.init(type: .custom)
        button.frame = CGRect(x: 100, y: 0, width: 50, height: 30)
        button.backgroundColor = UIColor.gray
        contentView.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: TwoCellReactor) {
        
        reactor.state.map({$0.content})
            .subscribe(onNext: {[weak self] (content) in
                self?.textLabel?.text = content
            }).disposed(by: disposeBag)
        
        let tap = button.rx.tap
        tap.map {[weak self] (_) -> TwoCellReactor.Action in
            guard let strongSelf = self else {
                return .noAction
            }
            return .onClick(strongSelf.indexPath)
        }.bind(to: reactor.action)
        .disposed(by: disposeBag)
    }
}
