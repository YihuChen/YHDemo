//
//  YHCollectionViewCell.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/5.
//

import UIKit

class YHCollectionViewCell: UICollectionViewCell, YHViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}