//
//  MovableGrideView.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import UIKit

class MovableGrideView: YHCollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var dimensionManager: MovableDimensionManager = MovableDimensionManager()
    private var itemDataArray: [String] = []
    
    //移动相关的属性
    private var orginIndexPath: IndexPath?
    private var moveSnapCell: UICollectionViewCell?
    private var lastPoint: CGPoint?
    
    
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
        switch ges.state {
        case .began:
            let currentPoint = ges.location(in: self)
            guard let currentIndex = indexPathForItem(at: currentPoint) else {
                return
            }
            print("beginInteractiveMovementForItem \(currentIndex)")
            beginInteractiveMovementForItem(at: currentIndex)
        case .changed:
            let currentPoint = ges.location(in: ges.view)
            updateInteractiveMovementTargetPosition(currentPoint)
            print("updateInteractiveMovementTargetPosition \(currentPoint)")
        case .ended:
            endInteractiveMovement()
            print("endInteractiveMovement")
        default:
            cancelInteractiveMovement()
            print("cancelInteractiveMovement")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    private func moveGestureDidBegin(atIndexPath indexPath: IndexPath, point: CGPoint) {
        guard indexPath.section != 0 else { return }
        orginIndexPath = indexPath
        lastPoint = point
        
        let cell = cellForItem(at: indexPath)!
        let dataModel = itemDataArray[indexPath.item]
        
        moveSnapCell = MovableGrideCell.init(frame: cell.frame)
        moveSnapCell?.alpha = 0
        moveSnapCell?.center = point
        (moveSnapCell as? MovableGrideCell)?.loadData(with: dataModel)
        
        addSubview(moveSnapCell!)
        
        UIView.animate(withDuration: BaseDimensions.animDuration) {
            self.moveSnapCell?.alpha = 1
            cell.alpha = 0
        } completion: { _ in
            cell.isHidden = true
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
