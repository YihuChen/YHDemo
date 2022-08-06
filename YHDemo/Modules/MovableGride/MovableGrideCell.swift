//
//  MovableGrideCell.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import UIKit

class MovableGrideCell: YHCollectionViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(text: "", textColor: UIColor.black, font: R.font.shetumodengxiaofangti(size: 24)!)
        return label
    }()
    
    override func makeUI() {
        super.makeUI()
        
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = BaseDimensions.cornerRadius * 2
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func loadData(with dataModel: Any) {
        titleLabel.text = dataModel as? String
    }
    
}
