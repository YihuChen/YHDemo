//
//  MovableCollectionView.swift
//  YHDemo
//
//  Created by 陈毅琥 on 2022/8/6.
//

import UIKit

class MovableCollectionView: YHCollectionView, YHViewProtocol {
    let inset: CGFloat = 10
    let lineSpacing: CGFloat = 10
    let itemSpacing: CGFloat = 10
    let itemHeight: CGFloat = 80
    
    override func loadCollectionViewRegisterInfo() {
        register(MovableGrideCell.self, forCellWithReuseIdentifier: ReuseIdentifiers.MovableGrideCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        lineSpacing
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        itemSpacing
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (BaseDimensions.screenWidth - inset * 2 - itemSpacing) / 2
        return .init(width: itemWidth, height: itemHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifiers.MovableGrideCell, for: indexPath)
        let dataModel = dataArray(for: indexPath.section)[indexPath.item]
        (cell as? MovableGrideCell)?.loadData(with: dataModel)
        return cell
    }
    
    func loadData(with dataModel: Any) {
        guard let model = dataModel as? MovableCollectionModel else { return  }
        
        dataArray[0] = model.dataArray
        reloadData()
    }

}
