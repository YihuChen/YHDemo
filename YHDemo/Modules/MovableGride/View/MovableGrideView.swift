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
    private var moveSnapCell: UICollectionViewCell?
    private var lastPoint: CGPoint?
    private var orginIndexPath: IndexPath?
    private var moveIndexPath: IndexPath?
    
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
        let currentPoint = ges.location(in: self)
        switch ges.state {
        case .began:
            guard let currentIndex = indexPathForItem(at: currentPoint) else { return }
            moveGestureDidBegin(atIndexPath: currentIndex, point: currentPoint)
        case .changed:
            moveGestureDidChange(atPoint: currentPoint)
        case .ended:
            moveGestureDidEnd()
        default:
            moveGestureDidEnd()
        }
    }
    
    private func moveGestureDidBegin(atIndexPath indexPath: IndexPath, point: CGPoint) {
        guard indexPath.section == 0 else { return }
        YHFeedback.occurred(.light)     //震动反馈
        
        orginIndexPath = indexPath
        lastPoint = point
        
        let cell = cellForItem(at: indexPath)!
        let dataModel = itemDataArray[indexPath.item]
        
        moveSnapCell = MovableGrideCell.init(frame: cell.frame)
        moveSnapCell?.alpha = 0
        moveSnapCell?.center = point
        moveSnapCell?.revealShadowLayer()
        (moveSnapCell as? MovableGrideCell)?.loadData(with: dataModel)
        
        addSubview(moveSnapCell!)
        
        UIView.animate(withDuration: BaseDimensions.animDuration) {
            self.moveSnapCell?.alpha = 1
            cell.alpha = 0
        } completion: { _ in
            cell.isHidden = true
        }
    }
    
    private func moveGestureDidChange(atPoint point: CGPoint) {
        if orginIndexPath == nil { return }
        
        moveSnapCell?.center = point
        //TODO 计算大小
    }
    
    private func moveGestureDidEnd() {
        if orginIndexPath == nil { return }
        
        let cell = cellForItem(at: orginIndexPath!)
        cell?.isHidden = false
        UIView.animate(withDuration: BaseDimensions.animDuration) {
            self.moveSnapCell?.alpha = 0
            cell?.alpha = 1
        } completion: { _ in
            self.moveSnapCell?.removeFromSuperview()
            self.moveSnapCell = nil
            self.orginIndexPath = nil
            self.lastPoint = nil
            
            self.reloadData()
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

//    @objc private func handleLongPressGes(ges: UILongPressGestureRecognizer) {
//        let currentPoint = ges.location(in: self)
//        switch ges.state {
//        case .began:
//            guard let currentIndex = indexPathForItem(at: currentPoint) else { return }
//            beginInteractiveMovementForItem(at: currentIndex)
//        case .changed:
//            updateInteractiveMovementTargetPosition(currentPoint)
//        case .ended:
//            endInteractiveMovement()
//        default:
//            cancelInteractiveMovement()
//        }
//    }
//
//    //要用系统移动的API的话 一定要实现这个方法 不然移动会失效
//    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//
//    }
}
