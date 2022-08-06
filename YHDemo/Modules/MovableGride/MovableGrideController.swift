//
//  MovableGrideController.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/5.
//

import UIKit
import SnapKit

class MovableGrideController: YHViewController {
    lazy var collectionView: MovableCollectionView = {
        return MovableCollectionView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func makeUI() {
        view.backgroundColor = .black
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func fetchData() {
        let model = MovableCollectionModel.init(dataArray: ["1", "2", "3", "4", "5", "6", "7", "8", "9"])
        collectionView.loadData(with: model)
    }


}
