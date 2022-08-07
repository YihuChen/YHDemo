//
//  YHCollectionView.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/5.
//

import UIKit

class YHCollectionView: UICollectionView, YHViewProtocol {

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        initConfig()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initConfig()
    }
    
    func initConfig() {
        backgroundColor = .clear
    }
    
    func loadData(with dataModel: Any) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
