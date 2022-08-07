//
//  MovableGrideView.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import UIKit

class MovableGrideView: YHCollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var dimensionManager: MovableDimensionManager = MovableDimensionManager()
    var itemDataArray: [String] = []
    
    override func initConfig() {
        super.initConfig()
        
        delegate = self
        dataSource = self
        register(MovableGrideCell.self, forCellWithReuseIdentifier: ReuseIdentifiers.MovableGrideCell)
        
        let longPressGes = UILongPressGestureRecognizer.init(target: self, action: #selector(handleLongPressGes(ges:)))
        longPressGes.minimumPressDuration = 0.3
        addGestureRecognizer(longPressGes)
    }
    
    override func loadData(with dataModel: Any) {
        guard let model = dataModel as? MovableCollectionModel else { return  }
        
        itemDataArray = model.itemDataArray
        dimensionManager.loadGrideSizeData(with: model.itemSizeDeses)
        reloadData()
    }
    
    //MARK: - 长按手势
    @objc private func handleLongPressGes(ges: UILongPressGestureRecognizer) {
        let currentPoint = ges.location(in: ges.view)
        print(currentPoint)
        switch ges.state {
        case .began:
            guard let currentIndex = indexPathForItem(at: currentPoint) else { return }
            beginInteractiveMovementForItem(at: currentIndex)
        case .changed:
            updateInteractiveMovementTargetPosition(currentPoint)
        case .ended:
            endInteractiveMovement()
        default:
            cancelInteractiveMovement()
        }
    }
    
    // MARK: - Collection delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = dimensionManager.sectionInset
        return .init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        dimensionManager.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        dimensionManager.itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        dimensionManager.itemSizeArray[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifiers.MovableGrideCell, for: indexPath)
        let dataModel = itemDataArray[indexPath.item]
        (cell as? MovableGrideCell)?.loadData(with: dataModel)
        return cell
    }

}
